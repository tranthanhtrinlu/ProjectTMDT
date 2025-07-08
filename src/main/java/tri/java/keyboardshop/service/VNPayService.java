package tri.java.keyboardshop.service;

import jakarta.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class VNPayService {

    private static final Logger logger = LoggerFactory.getLogger(VNPayService.class);

    @Value("${tmdt.vnpay.tmn-code}")
    private String vnp_TmnCode;

    @Value("${tmdt.vnpay.hash-secret}")
    private String secretKey;

    @Value("${tmdt.vnpay.vnp-return-url}")
    private String vnp_ReturnUrl;

    @Value("${tmdt.vnpay.vnp-url}")
    private String vnp_PayUrl;

    public String generateVNPayURL(double amountDouble, String paymentRef, String ip)
            throws UnsupportedEncodingException {

        // Validate input parameters
        if (amountDouble <= 0) {
            logger.error("Invalid amount: {}", amountDouble);
            throw new IllegalArgumentException("Số tiền phải lớn hơn 0");
        }
        
        if (paymentRef == null || paymentRef.trim().isEmpty()) {
            logger.error("Invalid payment reference: {}", paymentRef);
            throw new IllegalArgumentException("Mã thanh toán không được để trống");
        }
        
        if (ip == null || ip.trim().isEmpty()) {
            logger.error("Invalid IP address: {}", ip);
            throw new IllegalArgumentException("Địa chỉ IP không hợp lệ");
        }

        // Convert amount to VND cents safely using BigDecimal
        BigDecimal amountBD = new BigDecimal(amountDouble);
        BigDecimal amountInCents = amountBD.multiply(new BigDecimal("100")).setScale(0, RoundingMode.HALF_UP);
        long amount = amountInCents.longValue();
        
        logger.info("Generating VNPay URL for amount: {} VND (original: {}), paymentRef: {}, IP: {}", 
                    amount, amountDouble, paymentRef, ip);

        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "other";

        String vnp_TxnRef = paymentRef.trim();
        String vnp_IpAddr = ip.trim();

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);
        vnp_Params.put("vnp_Locale", "vn");
        vnp_Params.put("vnp_ReturnUrl", vnp_ReturnUrl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator<String> itr = fieldNames.iterator();

        while (itr.hasNext()) {
            String fieldName = itr.next();
            String fieldValue = vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                // Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                // Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = hmacSHA512(secretKey, hashData.toString());
        
        if (vnp_SecureHash == null || vnp_SecureHash.isEmpty()) {
            logger.error("Failed to generate secure hash");
            throw new RuntimeException("Không thể tạo mã bảo mật cho VNPay");
        }
        
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = vnp_PayUrl + "?" + queryUrl;
        
        logger.info("Generated VNPay URL successfully for payment ref: {}", paymentRef);
        return paymentUrl;
    }

    public String hmacSHA512(final String key, final String data) {
        try {
            if (key == null || data == null) {
                logger.error("HMAC key or data is null");
                throw new IllegalArgumentException("Key và data không được null");
            }
            
            final Mac hmac512 = Mac.getInstance("HmacSHA512");
            byte[] hmacKeyBytes = key.getBytes(StandardCharsets.UTF_8);
            final SecretKeySpec secretKey = new SecretKeySpec(hmacKeyBytes, "HmacSHA512");
            hmac512.init(secretKey);
            byte[] dataBytes = data.getBytes(StandardCharsets.UTF_8);
            byte[] result = hmac512.doFinal(dataBytes);
            StringBuilder sb = new StringBuilder(2 * result.length);
            for (byte b : result) {
                sb.append(String.format("%02x", b & 0xff));
            }
            return sb.toString();

        } catch (Exception ex) {
            logger.error("Error generating HMAC-SHA512: {}", ex.getMessage(), ex);
            throw new RuntimeException("Lỗi tạo mã bảo mật: " + ex.getMessage(), ex);
        }
    }

    public String getIpAddress(HttpServletRequest request) {
        String ipAddress = null;
        try {
            ipAddress = request.getHeader("X-FORWARDED-FOR");
            if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
                ipAddress = request.getHeader("X-Real-IP");
            }
            if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
                ipAddress = request.getRemoteAddr();
            }
            
            // If multiple IPs, get the first one
            if (ipAddress != null && ipAddress.contains(",")) {
                ipAddress = ipAddress.split(",")[0].trim();
            }
            
            // Default to localhost if still null
            if (ipAddress == null || ipAddress.isEmpty()) {
                ipAddress = "127.0.0.1";
            }
            
            logger.debug("Client IP address: {}", ipAddress);
            return ipAddress;
            
        } catch (Exception e) {
            logger.error("Error getting IP address: {}", e.getMessage(), e);
            return "127.0.0.1";
        }
    }

    /**
     * Validate VNPay response parameters
     */
    public boolean validateSignature(Map<String, String> params, String vnpSecureHash) {
        try {
            // Remove vnp_SecureHash and vnp_SecureHashType from params
            Map<String, String> validationParams = new HashMap<>(params);
            validationParams.remove("vnp_SecureHash");
            validationParams.remove("vnp_SecureHashType");
            
            // Sort and build hash data
            List<String> fieldNames = new ArrayList<>(validationParams.keySet());
            Collections.sort(fieldNames);
            StringBuilder hashData = new StringBuilder();
            
            for (String fieldName : fieldNames) {
                String fieldValue = validationParams.get(fieldName);
                if (fieldValue != null && !fieldValue.isEmpty()) {
                    if (hashData.length() > 0) {
                        hashData.append('&');
                    }
                    hashData.append(fieldName).append('=').append(fieldValue);
                }
            }
            
            String calculatedHash = hmacSHA512(secretKey, hashData.toString());
            boolean isValid = calculatedHash.equals(vnpSecureHash);
            
            logger.info("VNPay signature validation: {}", isValid ? "VALID" : "INVALID");
            return isValid;
            
        } catch (Exception e) {
            logger.error("Error validating VNPay signature: {}", e.getMessage(), e);
            return false;
        }
    }
}

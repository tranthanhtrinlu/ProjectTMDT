$(document).ready(function() {
    const customOrderId = window.customOrderData.id;
    const basePrice = window.customOrderData.basePrice;
    let currentTotal = basePrice;
    
    // Service prices
    const servicePrices = window.customOrderData.servicePrices;
    
    // Load existing selections if any
    loadExistingSelections();
    
    // Handle product option selection
    $('.product-option').click(function() {
        const type = $(this).data('type');
        $(`.product-option[data-type="${type}"]`).removeClass('selected');
        $(this).addClass('selected');
        $(this).find('input[type="radio"]').prop('checked', true);
        updatePrice();
        updateCustomOrder();
    });
    
    // Handle service checkbox changes
    $('input[name="services"]').change(function() {
        updatePrice();
        updateCustomOrder();
    });
    
    // Handle custom notes change
    $('textarea[name="customNotes"]').on('blur', function() {
        updateCustomOrder();
    });
    
    function loadExistingSelections() {
        // Load from server data if available
        if (window.customOrderData.selectedKeycapId) {
            $(`input[name="keycap"][value="${window.customOrderData.selectedKeycapId}"]`).prop('checked', true).closest('.product-option').addClass('selected');
        }
        
        if (window.customOrderData.selectedSwitchType) {
            $(`input[name="switch"][value="${window.customOrderData.selectedSwitchType}"]`).prop('checked', true).closest('.product-option').addClass('selected');
        }
        
        if (window.customOrderData.selectedKitId) {
            $(`input[name="kit"][value="${window.customOrderData.selectedKitId}"]`).prop('checked', true).closest('.product-option').addClass('selected');
        }
        
        // Load services
        if (window.customOrderData.lubingService) {
            $('#lubing').prop('checked', true);
        }
        if (window.customOrderData.stabilizerTuning) {
            $('#stabilizer').prop('checked', true);
        }
        if (window.customOrderData.keycapCustomization) {
            $('#keycap_custom').prop('checked', true);
        }
        if (window.customOrderData.cableCustomization) {
            $('#cable').prop('checked', true);
        }
        if (window.customOrderData.caseModding) {
            $('#case').prop('checked', true);
        }
        
        // Load custom notes
        if (window.customOrderData.customNotes) {
            $('textarea[name="customNotes"]').val(window.customOrderData.customNotes);
        }
        
        // Update price with existing selections
        updatePrice();
    }
    
    function updatePrice() {
        let total = basePrice;
        
        // Add keycap price
        const selectedKeycap = $('input[name="keycap"]:checked');
        if (selectedKeycap.val() !== '0') {
            const keycapPrice = parseFloat($(selectedKeycap).closest('.product-option').data('price')) || 0;
            total += keycapPrice;
            if (keycapPrice > 0) {
                $('.keycap-price').show();
                $('.keycap-price span:last').text(formatNumber(keycapPrice) + ' đ');
            }
        } else {
            $('.keycap-price').hide();
        }
        
        // Add kit price
        const selectedKit = $('input[name="kit"]:checked');
        if (selectedKit.val() !== '0') {
            const kitPrice = parseFloat($(selectedKit).closest('.product-option').data('price')) || 0;
            total += kitPrice;
            if (kitPrice > 0) {
                $('.kit-price').show();
                $('.kit-price span:last').text(formatNumber(kitPrice) + ' đ');
            }
        } else {
            $('.kit-price').hide();
        }
        
        // Add service prices
        $('.service-prices').empty();
        $('input[name="services"]:checked').each(function() {
            const serviceName = $(this).val();
            const servicePrice = servicePrices[serviceName] || 0;
            total += servicePrice;
            
            $('.service-prices').append(`
                <div class="d-flex justify-content-between mb-2">
                    <span>${getServiceDisplayName(serviceName)}:</span>
                    <span>${formatNumber(servicePrice)} đ</span>
                </div>
            `);
        });
        
        // Update total
        $('.total-price').text(formatNumber(total) + ' đ');
        currentTotal = total;
    }
    
    function updateCustomOrder() {
        const keycapId = $('input[name="keycap"]:checked').val();
        const switchType = $('input[name="switch"]:checked').val();
        const kitId = $('input[name="kit"]:checked').val();
        const customNotes = $('textarea[name="customNotes"]').val();
        
        const services = [];
        $('input[name="services"]:checked').each(function() {
            services.push($(this).val());
        });
        
        const data = {
            keycapId: keycapId !== '0' ? keycapId : null,
            switchType: switchType,
            kitId: kitId !== '0' ? kitId : null,
            lubingService: services.includes('lubing'),
            stabilizerTuning: services.includes('stabilizer'),
            keycapCustomization: services.includes('keycap_custom'),
            cableCustomization: services.includes('cable'),
            caseModding: services.includes('case'),
            customNotes: customNotes
        };
        
        $.ajax({
            url: `/custom/update/${customOrderId}`,
            method: 'POST',
            data: data,
            headers: {
                'X-CSRF-TOKEN': $('meta[name="_csrf"]').attr('content')
            },
            success: function(response) {
                try {
                    const result = JSON.parse(response);
                    if (result.success) {
                        console.log('Custom order updated successfully');
                        // Update total price if returned from server
                        if (result.totalPrice) {
                            $('.total-price').text(formatNumber(result.totalPrice) + ' đ');
                        }
                    } else {
                        console.log('Error updating custom order:', result.message);
                    }
                } catch (e) {
                    console.log('Error parsing response:', e);
                }
            },
            error: function(xhr, status, error) {
                console.log('AJAX Error updating custom order:', error);
            }
        });
    }
    
    function formatNumber(num) {
        return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
    
    function getServiceDisplayName(serviceName) {
        const names = {
            lubing: 'Lubing Service',
            stabilizer: 'Stabilizer Tuning',
            keycap_custom: 'Keycap Custom',
            cable: 'Cable Custom',
            case: 'Case Modding'
        };
        return names[serviceName] || serviceName;
    }
}); 
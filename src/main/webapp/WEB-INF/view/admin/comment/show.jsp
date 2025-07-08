<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageTitle" value="Quản lý bình luận" />
<jsp:include page="../layout/header.jsp" />

<!-- Header -->
<div class="flex justify-between items-center mb-6">
    <div>
        <h1 class="text-2xl font-bold text-gray-900">Quản lý bình luận</h1>
        <p class="text-gray-600">Quản lý và phản hồi bình luận của khách hàng</p>
    </div>
    <button id="refreshComments" class="bg-gray-500 hover:bg-gray-600 text-white px-4 py-2 rounded-lg flex items-center">
        <i class="fas fa-sync-alt mr-2"></i>
        Làm mới
    </button>
</div>

<!-- Filters -->
<div class="bg-white rounded-lg shadow-sm p-6 mb-6">
    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">Tìm kiếm</label>
            <input type="text" id="searchInput" placeholder="Nội dung bình luận, tên người dùng..." 
                   class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500">
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">Loại bình luận</label>
            <select id="typeFilter" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500">
                <option value="">Tất cả</option>
                <option value="parent">Bình luận gốc</option>
                <option value="reply">Phản hồi</option>
            </select>
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">&nbsp;</label>
            <button id="resetFilters" class="w-full px-4 py-2 bg-gray-500 text-white rounded-lg hover:bg-gray-600">
                Đặt lại
            </button>
        </div>
    </div>
</div>

<!-- Comments List -->
<div class="space-y-6">
    <c:forEach var="comment" items="${comments}">
        <div class="bg-white rounded-lg shadow-sm p-6" data-comment-id="${comment.id}">
            <!-- Comment Header -->
            <div class="flex items-start justify-between mb-4">
                <div class="flex items-start space-x-3">
                    <div class="flex-shrink-0">
                        <c:choose>
                            <c:when test="${not empty comment.user.avatar}">
                                <img class="h-10 w-10 rounded-full object-cover" 
                                     src="/images/avatar/${comment.user.avatar}" 
                                     alt="${comment.user.fullName}">
                            </c:when>
                            <c:otherwise>
                                <div class="h-10 w-10 rounded-full bg-gray-300 flex items-center justify-center">
                                    <i class="fas fa-user text-gray-500"></i>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div>
                        <div class="flex items-center space-x-2">
                            <h3 class="text-sm font-medium text-gray-900">
                                ${comment.user.fullName}
                            </h3>
                            <c:if test="${comment.user.role.name == 'ADMIN'}">
                                <span class="inline-flex px-2 py-1 text-xs font-semibold rounded-full bg-purple-100 text-purple-800">
                                    <i class="fas fa-shield-alt mr-1"></i>
                                    Admin
                                </span>
                            </c:if>
                            <c:if test="${comment.parent != null}">
                                <span class="inline-flex px-2 py-1 text-xs font-semibold rounded-full bg-blue-100 text-blue-800">
                                    <i class="fas fa-reply mr-1"></i>
                                    Phản hồi
                                </span>
                            </c:if>
                        </div>
                        <p class="text-sm text-gray-500">
                            <fmt:formatDate value="${comment.createdAt}" pattern="dd/MM/yyyy HH:mm"/>
                        </p>
                    </div>
                </div>
                <div class="flex space-x-2">
                    <c:if test="${comment.parent == null}">
                        <button onclick="openReplyModal(${comment.id}, '${comment.user.fullName}')" 
                                class="text-blue-600 hover:text-blue-900" title="Trả lời">
                            <i class="fas fa-reply"></i>
                        </button>
                    </c:if>
                    <button data-comment-id="${comment.id}" class="delete-comment-btn text-red-600 hover:text-red-900" title="Xóa">
                        <i class="fas fa-trash"></i>
                    </button>
                </div>
            </div>

            <!-- Product Info -->
            <div class="mb-4 p-3 bg-gray-50 rounded-lg">
                <div class="flex items-center space-x-3">
                    <img class="h-12 w-12 rounded-lg object-cover" 
                         src="/images/product/${comment.product.image}" 
                         alt="${comment.product.name}"
                         onerror="this.src='/images/product/default.jpg'">
                    <div>
                        <h4 class="text-sm font-medium text-gray-900">
                            ${comment.product.name}
                        </h4>
                        <p class="text-sm text-gray-500">
                            <fmt:formatNumber value="${comment.product.price}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                        </p>
                    </div>
                </div>
            </div>

            <!-- Comment Content -->
            <div class="mb-4">
                <c:if test="${comment.parent != null}">
                    <div class="mb-3 p-3 bg-gray-100 rounded-lg border-l-4 border-gray-400">
                        <p class="text-sm text-gray-600 font-medium">
                            Trả lời cho ${comment.parent.user.fullName}:
                        </p>
                        <p class="text-sm text-gray-500 mt-1 line-clamp-2">
                            ${comment.parent.content}
                        </p>
                    </div>
                </c:if>
                <div class="prose prose-sm max-w-none">
                    <p class="text-gray-800">${comment.content}</p>
                </div>
            </div>

            <!-- Replies Count -->
            <c:if test="${comment.parent == null}">
                <c:set var="replyCount" value="0" />
                <c:forEach var="c" items="${comments}">
                    <c:if test="${c.parent != null && c.parent.id == comment.id}">
                        <c:set var="replyCount" value="${replyCount + 1}" />
                    </c:if>
                </c:forEach>
                <c:if test="${replyCount > 0}">
                    <div class="mt-4 pt-4 border-t border-gray-200">
                        <p class="text-sm text-gray-500">
                            <i class="fas fa-comments mr-1"></i>
                            ${replyCount} phản hồi
                        </p>
                    </div>
                </c:if>
            </c:if>
        </div>
    </c:forEach>
</div>

<!-- Reply Modal -->
<div id="replyModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 hidden">
    <div class="bg-white rounded-lg max-w-md w-full mx-4">
        <div class="flex items-center justify-between p-6 border-b">
            <h3 id="replyModalTitle" class="text-lg font-semibold text-gray-800">Trả lời bình luận</h3>
            <button onclick="closeReplyModal()" class="text-gray-400 hover:text-gray-600">
                <i class="fas fa-times text-xl"></i>
            </button>
        </div>
        <form id="replyForm" class="p-6">
            <input type="hidden" id="parentCommentId" name="parentCommentId">
            
            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700 mb-2">Nội dung phản hồi *</label>
                <textarea id="replyContent" name="replyContent" rows="4" required
                          placeholder="Nhập nội dung phản hồi..."
                          class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500"></textarea>
            </div>
            
            <div class="flex justify-end space-x-3">
                <button type="button" onclick="closeReplyModal()" 
                        class="px-4 py-2 bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400">
                    Hủy
                </button>
                <button type="submit" 
                        class="px-4 py-2 bg-primary-500 text-white rounded-lg hover:bg-primary-600">
                    <i class="fas fa-reply mr-2"></i>
                    Gửi phản hồi
                </button>
            </div>
        </form>
    </div>
</div>

<!-- Empty State -->
<c:if test="${empty comments}">
    <div class="bg-white rounded-lg shadow-sm p-12 text-center">
        <div class="w-16 h-16 mx-auto mb-4 bg-gray-100 rounded-full flex items-center justify-center">
            <i class="fas fa-comments text-gray-400 text-2xl"></i>
        </div>
        <h3 class="text-lg font-medium text-gray-900 mb-2">Chưa có bình luận nào</h3>
        <p class="text-gray-500">Các bình luận của khách hàng sẽ hiển thị ở đây.</p>
    </div>
</c:if>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Filter functionality
    const searchInput = document.getElementById('searchInput');
    const typeFilter = document.getElementById('typeFilter');
    const resetButton = document.getElementById('resetFilters');
    const refreshButton = document.getElementById('refreshComments');
    
    // Filter events
    searchInput.addEventListener('input', filterComments);
    typeFilter.addEventListener('change', filterComments);
    
    resetButton.addEventListener('click', function() {
        searchInput.value = '';
        typeFilter.value = '';
        filterComments();
    });
    
    refreshButton.addEventListener('click', function() {
        location.reload();
    });
    
    // Reply form submission
    document.getElementById('replyForm').addEventListener('submit', handleReplySubmit);
    
    // Delete comment buttons
    document.addEventListener('click', function(e) {
        if (e.target.closest('.delete-comment-btn')) {
            const button = e.target.closest('.delete-comment-btn');
            const commentId = button.getAttribute('data-comment-id');
            console.log('Button clicked:', button);
            console.log('Data attribute value:', commentId);
            console.log('Button HTML:', button.outerHTML);
            deleteComment(commentId);
        }
    });
    
    function filterComments() {
        const searchTerm = searchInput.value.toLowerCase();
        const typeValue = typeFilter.value;
        
        const commentDivs = document.querySelectorAll('[data-comment-id]');
        
        commentDivs.forEach(div => {
            const content = div.querySelector('.prose p').textContent.toLowerCase();
            const userName = div.querySelector('.text-gray-900').textContent.toLowerCase();
            const isReply = div.querySelector('.bg-blue-100') !== null;
            
            let showComment = true;
            
            // Search filter
            if (searchTerm && !content.includes(searchTerm) && !userName.includes(searchTerm)) {
                showComment = false;
            }
            
            // Type filter
            if (typeValue) {
                if (typeValue === 'parent' && isReply) {
                    showComment = false;
                } else if (typeValue === 'reply' && !isReply) {
                    showComment = false;
                }
            }
            
            div.style.display = showComment ? '' : 'none';
        });
    }
});

function openReplyModal(commentId, userName) {
    document.getElementById('parentCommentId').value = commentId;
    document.getElementById('replyModalTitle').textContent = `Trả lời bình luận của ${userName}`;
    document.getElementById('replyContent').value = '';
    document.getElementById('replyModal').classList.remove('hidden');
    document.getElementById('replyContent').focus();
}

function closeReplyModal() {
    document.getElementById('replyModal').classList.add('hidden');
}

function handleReplySubmit(event) {
    event.preventDefault();
    
    const parentCommentId = document.getElementById('parentCommentId').value;
    const replyContent = document.getElementById('replyContent').value.trim();
    
    if (!replyContent) {
        showErrorToast('Vui lòng nhập nội dung phản hồi');
        return;
    }
    
    showLoading();
    
    const formData = new FormData();
    formData.append('replyContent', replyContent);
    
    fetch('/admin/comment/reply/' + parentCommentId, {
        method: 'POST',
        body: formData
    })
    .then(response => {
        console.log('Response status:', response.status);
        return response.json();
    })
    .then(data => {
        console.log('Response data:', data);
        if (data.success) {
            showSuccessToast(data.message || 'Phản hồi đã được gửi thành công');
            closeReplyModal();
            location.reload(); // Reload to show new reply
        } else {
            showErrorToast(data.message || 'Có lỗi xảy ra khi gửi phản hồi');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        showErrorToast('Có lỗi xảy ra khi gửi phản hồi');
    })
    .finally(() => {
        hideLoading();
    });
}

function deleteComment(commentId) {
    console.log('deleteComment called with commentId:', commentId);
    console.log('commentId type:', typeof commentId);
    
    if (!commentId || commentId === 'undefined' || commentId === 'null') {
        showErrorToast('Lỗi: ID bình luận không hợp lệ');
        return;
    }
    
    const deleteUrl = '/admin/comment/delete/' + commentId;
    console.log('Delete URL:', deleteUrl);
    
    showConfirmModal(
        'Bạn có chắc chắn muốn xóa bình luận này? Hành động này không thể hoàn tác.',
        function() {
            showLoading();
            
            fetch(deleteUrl, {
                method: 'POST'
            })
            .then(response => {
                console.log('Response status:', response.status);
                console.log('Response URL:', response.url);
                if (response.status === 404) {
                    throw new Error('Endpoint không tồn tại: ' + deleteUrl);
                }
                return response.json();
            })
            .then(data => {
                console.log('Response data:', data);
                if (data.success) {
                    showSuccessToast(data.message || 'Bình luận đã được xóa');
                    // Remove comment from UI
                    const commentDiv = document.querySelector('[data-comment-id="' + commentId + '"]');
                    if (commentDiv) {
                        commentDiv.style.opacity = '0.5';
                        setTimeout(() => {
                            commentDiv.remove();
                        }, 300);
                    }
                } else {
                    showErrorToast(data.message || 'Có lỗi xảy ra khi xóa bình luận');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showErrorToast('Có lỗi xảy ra khi xóa bình luận: ' + error.message);
            })
            .finally(() => {
                hideLoading();
            });
        }
    );
}

// Utility functions for notifications
function showSuccessToast(message) {
    alert('✅ ' + message);
}

function showErrorToast(message) {
    alert('❌ ' + message);
}

function showConfirmModal(message, callback) {
    if (confirm(message)) {
        callback();
    }
}

function showLoading() {
    // You can implement a loading spinner here
    console.log('Loading...');
}

function hideLoading() {
    // Hide loading spinner
    console.log('Loading finished');
}
</script>

<style>
.line-clamp-2 {
    overflow: hidden;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
}

.prose p {
    margin: 0;
    line-height: 1.6;
}
</style>

<jsp:include page="../layout/footer.jsp" /> 
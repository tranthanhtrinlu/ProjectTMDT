/**
 * Admin V2 JavaScript Framework
 * Modern Admin Interface for KeyZ Shop
 */

(function() {
    'use strict';
    
    // Global Admin object
    window.AdminV2 = {
        // Configuration
        config: {
            apiBase: '/api/admin-v2',
            refreshInterval: 30000, // 30 seconds
            animationDuration: 300,
            theme: localStorage.getItem('admin-theme') || 'light'
        },
        
        // Utilities
        utils: {},
        
        // Components
        components: {},
        
        // Services
        services: {},
        
        // Initialize
        init: function() {
            this.utils.init();
            this.components.init();
            this.services.init();
            this.bindEvents();
            this.loadTheme();
        },
        
        // Bind global events
        bindEvents: function() {
            // Keyboard shortcuts
            document.addEventListener('keydown', this.handleKeyboardShortcuts.bind(this));
            
            // Window resize
            window.addEventListener('resize', this.handleResize.bind(this));
            
            // Before unload
            window.addEventListener('beforeunload', this.handleBeforeUnload.bind(this));
        },
        
        // Handle keyboard shortcuts
        handleKeyboardShortcuts: function(e) {
            // Ctrl/Cmd + K for global search
            if ((e.ctrlKey || e.metaKey) && e.key === 'k') {
                e.preventDefault();
                this.components.search.focus();
            }
            
            // Ctrl/Cmd + / for help
            if ((e.ctrlKey || e.metaKey) && e.key === '/') {
                e.preventDefault();
                this.components.help.show();
            }
            
            // Escape to close modals/dropdowns
            if (e.key === 'Escape') {
                this.utils.closeAllDropdowns();
            }
        },
        
        // Handle window resize
        handleResize: function() {
            this.components.sidebar.handleResize();
            this.components.tables.handleResize();
        },
        
        // Handle before unload
        handleBeforeUnload: function(e) {
            if (this.utils.hasUnsavedChanges()) {
                e.preventDefault();
                e.returnValue = 'Bạn có thay đổi chưa được lưu. Bạn có chắc muốn rời khỏi trang?';
                return e.returnValue;
            }
        },
        
        // Load theme
        loadTheme: function() {
            document.documentElement.setAttribute('data-theme', this.config.theme);
        },
        
        notify: function(message, type = 'info') {
            console.log(`[${type.toUpperCase()}] ${message}`);
        }
    };
    
    // Utilities
    AdminV2.utils = {
        init: function() {
            this.setupCSRF();
            this.setupNotifications();
        },
        
        // Setup CSRF token for AJAX requests
        setupCSRF: function() {
            const token = document.querySelector('meta[name="_csrf"]');
            const header = document.querySelector('meta[name="_csrf_header"]');
            
            if (token && header) {
                $.ajaxSetup({
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader(header.getAttribute('content'), token.getAttribute('content'));
                    }
                });
            }
        },
        
        // Setup notification system
        setupNotifications: function() {
            this.notifications = {
                container: null,
                queue: [],
                
                show: function(message, type = 'info', duration = 5000) {
                    if (!this.container) {
                        this.container = this.createContainer();
                    }
                    
                    const notification = this.createNotification(message, type, duration);
                    this.container.appendChild(notification);
                    
                    // Animate in
                    setTimeout(() => {
                        notification.classList.add('show');
                    }, 10);
                    
                    // Auto remove
                    if (duration > 0) {
                        setTimeout(() => {
                            this.remove(notification);
                        }, duration);
                    }
                    
                    return notification;
                },
                
                createContainer: function() {
                    const container = document.createElement('div');
                    container.className = 'notification-container';
                    container.style.cssText = `
                        position: fixed;
                        top: 20px;
                        right: 20px;
                        z-index: 9999;
                        pointer-events: none;
                    `;
                    document.body.appendChild(container);
                    return container;
                },
                
                createNotification: function(message, type, duration) {
                    const notification = document.createElement('div');
                    notification.className = `notification notification-${type}`;
                    notification.style.cssText = `
                        background: white;
                        border: 1px solid #e2e8f0;
                        border-radius: 0.75rem;
                        padding: 1rem 1.5rem;
                        margin-bottom: 0.5rem;
                        box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
                        transform: translateX(100%);
                        transition: all 0.3s ease;
                        pointer-events: auto;
                        min-width: 300px;
                        max-width: 400px;
                    `;
                    
                    const iconMap = {
                        success: 'fas fa-check-circle',
                        error: 'fas fa-exclamation-circle',
                        warning: 'fas fa-exclamation-triangle',
                        info: 'fas fa-info-circle'
                    };
                    
                    const colorMap = {
                        success: '#10b981',
                        error: '#ef4444',
                        warning: '#f59e0b',
                        info: '#06b6d4'
                    };
                    
                    notification.innerHTML = `
                        <div style="display: flex; align-items: center; gap: 0.75rem;">
                            <i class="${iconMap[type]}" style="color: ${colorMap[type]}; font-size: 1.25rem;"></i>
                            <div style="flex: 1;">
                                <div style="font-weight: 600; color: #1e293b; margin-bottom: 0.25rem;">
                                    ${type.charAt(0).toUpperCase() + type.slice(1)}
                                </div>
                                <div style="color: #64748b; font-size: 0.875rem;">
                                    ${message}
                                </div>
                            </div>
                            <button onclick="AdminV2.utils.notifications.remove(this.closest('.notification'))" 
                                    style="background: none; border: none; color: #94a3b8; cursor: pointer; padding: 0.25rem;">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                    `;
                    
                    return notification;
                },
                
                remove: function(notification) {
                    notification.style.transform = 'translateX(100%)';
                    notification.style.opacity = '0';
                    setTimeout(() => {
                        if (notification.parentNode) {
                            notification.parentNode.removeChild(notification);
                        }
                    }, 300);
                }
            };
        },
        
        // Show notification
        notify: function(message, type = 'info', duration = 5000) {
            return this.notifications.show(message, type, duration);
        },
        
        // Format currency
        formatCurrency: function(amount) {
            return new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(amount);
        },
        
        // Format date
        formatDate: function(date, format = 'dd/MM/yyyy') {
            if (!date) return '';
            const d = new Date(date);
            return d.toLocaleDateString('vi-VN');
        },
        
        // Format relative time
        formatRelativeTime: function(date) {
            if (!date) return '';
            const now = new Date();
            const diff = now - new Date(date);
            const seconds = Math.floor(diff / 1000);
            const minutes = Math.floor(seconds / 60);
            const hours = Math.floor(minutes / 60);
            const days = Math.floor(hours / 24);
            
            if (seconds < 60) return 'Vừa xong';
            if (minutes < 60) return `${minutes} phút trước`;
            if (hours < 24) return `${hours} giờ trước`;
            if (days < 7) return `${days} ngày trước`;
            return this.formatDate(date);
        },
        
        // Debounce function
        debounce: function(func, wait) {
            let timeout;
            return function executedFunction(...args) {
                const later = () => {
                    clearTimeout(timeout);
                    func(...args);
                };
                clearTimeout(timeout);
                timeout = setTimeout(later, wait);
            };
        },
        
        // Close all dropdowns
        closeAllDropdowns: function() {
            document.querySelectorAll('.dropdown-menu.show, .notification-dropdown.show, .user-dropdown.show')
                .forEach(dropdown => dropdown.classList.remove('show'));
        },
        
        // Check for unsaved changes
        hasUnsavedChanges: function() {
            return document.querySelector('[data-unsaved="true"]') !== null;
        },
        
        // Mark form as dirty
        markFormDirty: function(form) {
            form.setAttribute('data-unsaved', 'true');
        },
        
        // Mark form as clean
        markFormClean: function(form) {
            form.removeAttribute('data-unsaved');
        }
    };
    
    // Components
    AdminV2.components = {
        init: function() {
            this.search.init();
            this.sidebar.init();
            this.tables.init();
            this.forms.init();
            this.modals.init();
            this.charts.init();
        },
        
        // Search component
        search: {
            input: null,
            
            init: function() {
                this.input = document.getElementById('globalSearch');
                if (this.input) {
                    this.bindEvents();
                }
            },
            
            bindEvents: function() {
                this.input.addEventListener('input', AdminV2.utils.debounce(this.handleSearch.bind(this), 300));
                this.input.addEventListener('focus', this.handleFocus.bind(this));
                this.input.addEventListener('blur', this.handleBlur.bind(this));
            },
            
            handleSearch: function(e) {
                const query = e.target.value.trim();
                if (query.length > 2) {
                    this.performSearch(query);
                }
            },
            
            handleFocus: function() {
                this.input.parentElement.classList.add('focused');
            },
            
            handleBlur: function() {
                setTimeout(() => {
                    this.input.parentElement.classList.remove('focused');
                }, 200);
            },
            
            performSearch: function(query) {
                // Implementation for global search
                console.log('Searching for:', query);
            },
            
            focus: function() {
                if (this.input) {
                    this.input.focus();
                }
            }
        },
        
        // Sidebar component
        sidebar: {
            element: null,
            collapsed: false,
            
            init: function() {
                this.element = document.querySelector('.admin-sidebar');
                this.collapsed = localStorage.getItem('sidebarCollapsed') === 'true';
                this.applyState();
                this.bindEvents();
            },
            
            bindEvents: function() {
                // Navigation link clicks
                this.element.querySelectorAll('.nav-link').forEach(link => {
                    link.addEventListener('click', this.handleNavClick.bind(this));
                });
            },
            
            handleNavClick: function(e) {
                // Add loading state
                const link = e.currentTarget;
                link.classList.add('loading');
                
                // Remove loading state after navigation
                setTimeout(() => {
                    link.classList.remove('loading');
                }, 1000);
            },
            
            toggle: function() {
                this.collapsed = !this.collapsed;
                this.applyState();
                localStorage.setItem('sidebarCollapsed', this.collapsed);
            },
            
            applyState: function() {
                if (this.collapsed) {
                    this.element.classList.add('collapsed');
                    document.querySelector('.admin-content').classList.add('expanded');
                } else {
                    this.element.classList.remove('collapsed');
                    document.querySelector('.admin-content').classList.remove('expanded');
                }
            },
            
            handleResize: function() {
                if (window.innerWidth <= 1024) {
                    this.element.classList.remove('collapsed');
                    document.querySelector('.admin-content').classList.remove('expanded');
                }
            }
        },
        
        // Tables component
        tables: {
            instances: [],
            
            init: function() {
                this.initializeTables();
                this.bindEvents();
            },
            
            initializeTables: function() {
                document.querySelectorAll('.table-container').forEach(container => {
                    this.enhanceTable(container);
                });
            },
            
            enhanceTable: function(container) {
                const table = container.querySelector('.table');
                if (!table) return;
                
                // Add sorting
                this.addSorting(table);
                
                // Add row selection
                this.addRowSelection(table);
                
                // Add pagination if needed
                this.addPagination(container);
                
                this.instances.push({
                    container: container,
                    table: table
                });
            },
            
            addSorting: function(table) {
                const headers = table.querySelectorAll('th[data-sortable]');
                headers.forEach(header => {
                    header.style.cursor = 'pointer';
                    header.addEventListener('click', this.handleSort.bind(this, header));
                });
            },
            
            addRowSelection: function(table) {
                // Add master checkbox
                const masterCheckbox = table.querySelector('th input[type="checkbox"]');
                if (masterCheckbox) {
                    masterCheckbox.addEventListener('change', this.handleMasterCheckboxChange.bind(this, table));
                }
                
                // Add row checkboxes
                const rowCheckboxes = table.querySelectorAll('td input[type="checkbox"]');
                rowCheckboxes.forEach(checkbox => {
                    checkbox.addEventListener('change', this.handleRowCheckboxChange.bind(this, table));
                });
            },
            
            addPagination: function(container) {
                // Implementation for pagination
            },
            
            handleSort: function(header) {
                const table = header.closest('.table');
                const column = header.cellIndex;
                const isAscending = header.classList.contains('sort-asc');
                
                // Remove existing sort classes
                table.querySelectorAll('th').forEach(th => {
                    th.classList.remove('sort-asc', 'sort-desc');
                });
                
                // Add new sort class
                header.classList.add(isAscending ? 'sort-desc' : 'sort-asc');
                
                // Sort the table (simplified version)
                this.sortTable(table, column, !isAscending);
            },
            
            sortTable: function(table, column, ascending) {
                const tbody = table.querySelector('tbody');
                const rows = Array.from(tbody.querySelectorAll('tr'));
                
                rows.sort((a, b) => {
                    const aValue = a.cells[column].textContent.trim();
                    const bValue = b.cells[column].textContent.trim();
                    
                    if (ascending) {
                        return aValue.localeCompare(bValue, 'vi-VN', { numeric: true });
                    } else {
                        return bValue.localeCompare(aValue, 'vi-VN', { numeric: true });
                    }
                });
                
                // Reorder rows
                rows.forEach(row => tbody.appendChild(row));
            },
            
            handleMasterCheckboxChange: function(table, e) {
                const rowCheckboxes = table.querySelectorAll('td input[type="checkbox"]');
                rowCheckboxes.forEach(checkbox => {
                    checkbox.checked = e.target.checked;
                });
                this.updateBulkActions(table);
            },
            
            handleRowCheckboxChange: function(table) {
                this.updateBulkActions(table);
            },
            
            updateBulkActions: function(table) {
                const checkedRows = table.querySelectorAll('td input[type="checkbox"]:checked');
                const bulkActions = document.querySelector('.bulk-actions');
                
                if (bulkActions) {
                    if (checkedRows.length > 0) {
                        bulkActions.style.display = 'block';
                        bulkActions.querySelector('.selected-count').textContent = checkedRows.length;
                    } else {
                        bulkActions.style.display = 'none';
                    }
                }
            },
            
            handleResize: function() {
                // Handle responsive tables
                this.instances.forEach(instance => {
                    // Implementation for responsive behavior
                });
            }
        },
        
        // Forms component
        forms: {
            init: function() {
                this.bindValidation();
                this.bindAutoSave();
                this.bindFormSubmission();
            },
            
            bindValidation: function() {
                document.querySelectorAll('form[data-validate]').forEach(form => {
                    this.enhanceForm(form);
                });
            },
            
            enhanceForm: function(form) {
                // Add real-time validation
                form.querySelectorAll('input, select, textarea').forEach(field => {
                    field.addEventListener('blur', this.validateField.bind(this, field));
                    field.addEventListener('input', AdminV2.utils.debounce(() => {
                        AdminV2.utils.markFormDirty(form);
                        this.validateField(field);
                    }, 500));
                });
            },
            
            validateField: function(field) {
                // Implementation for field validation
                const isValid = field.checkValidity();
                const feedback = field.parentElement.querySelector('.invalid-feedback');
                
                if (isValid) {
                    field.classList.remove('is-invalid');
                    field.classList.add('is-valid');
                    if (feedback) feedback.style.display = 'none';
                } else {
                    field.classList.remove('is-valid');
                    field.classList.add('is-invalid');
                    if (feedback) {
                        feedback.textContent = field.validationMessage;
                        feedback.style.display = 'block';
                    }
                }
            },
            
            bindAutoSave: function() {
                document.querySelectorAll('form[data-autosave]').forEach(form => {
                    setInterval(() => {
                        if (AdminV2.utils.hasUnsavedChanges()) {
                            this.autoSave(form);
                        }
                    }, 30000); // Auto-save every 30 seconds
                });
            },
            
            autoSave: function(form) {
                const formData = new FormData(form);
                // Implementation for auto-save
                console.log('Auto-saving form...');
            },
            
            bindFormSubmission: function() {
                document.querySelectorAll('form[data-ajax]').forEach(form => {
                    form.addEventListener('submit', this.handleAjaxSubmission.bind(this));
                });
            },
            
            handleAjaxSubmission: function(e) {
                e.preventDefault();
                const form = e.target;
                const submitButton = form.querySelector('button[type="submit"]');
                
                // Add loading state
                submitButton.classList.add('loading');
                submitButton.disabled = true;
                
                // Submit via AJAX
                const formData = new FormData(form);
                fetch(form.action, {
                    method: form.method,
                    body: formData
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        AdminV2.utils.notify(data.message || 'Lưu thành công!', 'success');
                        AdminV2.utils.markFormClean(form);
                    } else {
                        AdminV2.utils.notify(data.message || 'Có lỗi xảy ra!', 'error');
                    }
                })
                .catch(error => {
                    AdminV2.utils.notify('Lỗi kết nối!', 'error');
                })
                .finally(() => {
                    submitButton.classList.remove('loading');
                    submitButton.disabled = false;
                });
            }
        },
        
        // Modals component
        modals: {
            init: function() {
                this.bindEvents();
            },
            
            bindEvents: function() {
                // Dynamic modal loading
                document.querySelectorAll('[data-modal-url]').forEach(trigger => {
                    trigger.addEventListener('click', this.loadModal.bind(this));
                });
            },
            
            loadModal: function(e) {
                e.preventDefault();
                const trigger = e.currentTarget;
                const url = trigger.getAttribute('data-modal-url');
                
                fetch(url)
                .then(response => response.text())
                .then(html => {
                    this.showModal(html);
                })
                .catch(error => {
                    AdminV2.utils.notify('Không thể tải modal!', 'error');
                });
            },
            
            showModal: function(html) {
                const modalContainer = document.createElement('div');
                modalContainer.innerHTML = html;
                document.body.appendChild(modalContainer);
                
                const modal = modalContainer.querySelector('.modal');
                if (modal) {
                    const bootstrapModal = new bootstrap.Modal(modal);
                    bootstrapModal.show();
                    
                    // Clean up when modal is hidden
                    modal.addEventListener('hidden.bs.modal', () => {
                        document.body.removeChild(modalContainer);
                    });
                }
            }
        },
        
        // Charts component
        charts: {
            instances: [],
            
            init: function() {
                this.bindResize();
            },
            
            bindResize: function() {
                window.addEventListener('resize', AdminV2.utils.debounce(() => {
                    this.instances.forEach(chart => {
                        chart.resize();
                    });
                }, 250));
            },
            
            register: function(chart) {
                this.instances.push(chart);
            }
        },
        
        // Help component
        help: {
            show: function() {
                AdminV2.utils.notify('Phím tắt: Ctrl+K (tìm kiếm), Ctrl+/ (trợ giúp), Esc (đóng)', 'info', 8000);
            }
        }
    };
    
    // Services
    AdminV2.services = {
        init: function() {
            this.realtime.init();
            this.analytics.init();
        },
        
        // Real-time updates service
        realtime: {
            interval: null,
            
            init: function() {
                this.startPolling();
            },
            
            startPolling: function() {
                this.interval = setInterval(() => {
                    this.updateCounts();
                    this.updateNotifications();
                }, AdminV2.config.refreshInterval);
            },
            
            stopPolling: function() {
                if (this.interval) {
                    clearInterval(this.interval);
                    this.interval = null;
                }
            },
            
            updateCounts: function() {
                fetch(AdminV2.config.apiBase + '/counts')
                .then(response => response.json())
                .then(data => {
                    this.updateCountBadges(data);
                })
                .catch(error => {
                    console.error('Failed to update counts:', error);
                });
            },
            
            updateCountBadges: function(data) {
                Object.keys(data).forEach(key => {
                    const badge = document.getElementById(key + 'Count');
                    if (badge) {
                        badge.textContent = data[key];
                        badge.classList.add('pulse');
                        setTimeout(() => badge.classList.remove('pulse'), 1000);
                    }
                });
            },
            
            updateNotifications: function() {
                fetch(AdminV2.config.apiBase + '/notifications')
                .then(response => response.json())
                .then(data => {
                    this.updateNotificationBadge(data.count);
                })
                .catch(error => {
                    console.error('Failed to update notifications:', error);
                });
            },
            
            updateNotificationBadge: function(count) {
                const badge = document.querySelector('.notification-badge');
                if (badge) {
                    badge.textContent = count;
                    badge.style.display = count > 0 ? 'block' : 'none';
                }
            }
        },
        
        // Analytics service
        analytics: {
            init: function() {
                this.trackPageView();
                this.bindInteractionTracking();
            },
            
            trackPageView: function() {
                // Track page views for analytics
                const page = window.location.pathname;
                console.log('Page view:', page);
            },
            
            bindInteractionTracking: function() {
                // Track button clicks
                document.addEventListener('click', (e) => {
                    if (e.target.matches('.btn[data-track]')) {
                        this.trackEvent('button_click', {
                            button: e.target.getAttribute('data-track'),
                            page: window.location.pathname
                        });
                    }
                });
            },
            
            trackEvent: function(event, data) {
                console.log('Event:', event, data);
                // Send to analytics service
            }
        }
    };
    
    // Initialize when DOM is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', AdminV2.init.bind(AdminV2));
    } else {
        AdminV2.init();
    }
    
})(); 
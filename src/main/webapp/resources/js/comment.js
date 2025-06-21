document.addEventListener("DOMContentLoaded", function () {
    const replyForms = document.querySelectorAll("form");
    replyForms.forEach(form => {
        form.addEventListener("submit", function (e) {
            const textarea = this.querySelector("textarea");
            if (textarea.value.trim() === "") {
                e.preventDefault();
                alert("Nội dung phản hồi không được để trống.");
            }
        });
    });
});

let currentPage = 1;
const totalPages = 5;

function showPage(page) {
    for (let i = 1; i <= totalPages; i++) {
        document.getElementById(`page-${i}`).style.display = 'none';
        document.getElementById(`step-${i}`).classList.remove('active');
    }
    document.getElementById(`page-${page}`).style.display = 'block';
    document.getElementById(`step-${page}`).classList.add('active');
}

function nextPage() {
    if (currentPage < totalPages) {
        currentPage++;
        showPage(currentPage);
    }
}

function prevPage() {
    if (currentPage > 1) {
        currentPage--;
        showPage(currentPage);
    }
}

showPage(currentPage);
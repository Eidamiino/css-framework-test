export function toggleSidebar() {
    const sidebar = document.getElementById('sidebar');
    const mainContent = document.getElementById('main');
    const footer = document.getElementById('footer');

    const isCollapsed = sidebar.classList.contains('pure-u-1-8');
    sidebar.classList.toggle('pure-u-1-8', !isCollapsed);
    sidebar.classList.toggle('pure-u-1-24', isCollapsed);
    sidebar.classList.toggle('collapsed', isCollapsed);
    mainContent.classList.toggle('pure-u-7-8', !isCollapsed);
    mainContent.classList.toggle('pure-u-23-24', isCollapsed);
    footer.classList.toggle('pure-u-7-8', !isCollapsed);
    footer.classList.toggle('pure-u-23-24', isCollapsed);
}

export function initializeLoader(loaderLineId, loadingButtonId) {
    const loaderLine = document.getElementById(loaderLineId);
    const loadingButton = document.getElementById(loadingButtonId);
    let isLoading = false;
    let stopRequest = false;

    loaderLine.addEventListener('animationiteration', () => {
        if (stopRequest) {
            loaderLine.classList.remove('infinite');
            loaderLine.classList.remove('active');
            stopRequest = false;
        }
    });

    loadingButton.addEventListener('click', () => {
        if (!isLoading) {
            loaderLine.classList.add('active', 'infinite');
            isLoading = true;
        } else {
            stopRequest = true;
            isLoading = false;
        }
    });
}

// export function initializeToastr() {
//     toastr.options = {
//         closeButton: true,
//         progressBar: true,
//         positionClass: 'toast-bottom-right',
//         timeOut: '3000',
//     };
// }

// export function showToast(message = "Connection established.") {
//     toastr.success(message);
// }
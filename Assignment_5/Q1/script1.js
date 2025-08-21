const tooltip = document.getElementsByClassName('tooltip')[0];
const paragraphs = document.querySelectorAll('.para');

paragraphs.forEach(para => {
    para.addEventListener('mouseenter', (event) => {
        const length = event.target.textContent.length;
        
        tooltip.textContent = `Length: ${length} characters`;
        tooltip.style.visibility = 'visible';
        tooltip.style.opacity = '1';

        document.addEventListener('mousemove', (e) => {
            tooltip.style.top = `${e.clientY + 10}px`;
            tooltip.style.left = `${e.clientX + 10}px`;
        });
    });

    para.addEventListener('mouseleave', () => {
        tooltip.style.visibility = 'hidden';
        tooltip.style.opacity = '0';
    });
});

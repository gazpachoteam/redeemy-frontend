const sections = document.querySelectorAll('.full')
const links = document.querySelectorAll('.link')

sections.forEach(section => (
    section.addEventListener('mouseover', function(e) {
        links.forEach(item => {
            if(item.id === `${section.id}-item`) {
                item.classList.remove('active')
                item.classList.add('active')
            } else {
                item.classList.add('active')
                item.classList.remove('active')
            }
        })
    })
))
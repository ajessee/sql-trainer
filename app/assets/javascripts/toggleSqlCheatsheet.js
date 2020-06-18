document.addEventListener("DOMContentLoaded", function(e){
    var toggleCheatSheet = document.querySelector('#toggle-cheat-sheet');
    var cheatSheet = document.querySelector('#sql-cheat-sheet');
    cheatSheet.style.display = "none";
    
    toggleCheatSheet.addEventListener('click', function(e){
        if (cheatSheet.style.display === "none") {
            cheatSheet.style.display = "block";
            e.target.textContent = "Hide SQL Cheat Sheet";
            cheatSheet.scrollIntoView({ behavior: 'smooth'});
        } else {
            cheatSheet.style.display = "none";
            e.target.textContent = "Show SQL Cheat Sheet";
        }
    })
})

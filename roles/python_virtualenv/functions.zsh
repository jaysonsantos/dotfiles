# Remove python compiled byte-code in either current directory or in a
# list of specified directories
function pyclean() {
    ZSH_PYCLEAN_PLACES=${*:-'.'}
    find ${ZSH_PYCLEAN_PLACES} -type f -name "*.py[co]" -delete
    find ${ZSH_PYCLEAN_PLACES} -type d -name "__pycache__" -delete
}


# Clear all ipdb statements
function rmpdb() {
    git ls-files -oc --exclude-standard "*.py" | cat | xargs sed -i '' '/import ipdb;/d'
    echo "Cleared breakpoints"
}

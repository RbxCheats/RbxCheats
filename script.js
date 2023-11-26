document.getElementById('copyButton').addEventListener('click', function() {
    const textToCopy = document.getElementById('textToCopy');
    
    textToCopy.select();
    document.execCommand('copy');
});

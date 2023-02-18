

<div class="row mt-2">
	<nav>
		<div>
			<img class="p1" src="passion-it-ptv-ltd-logo.png" width="200"
				alt="img"> <img class="p2" src="Pcombinator.png" width="200"
				height="150" alt="img">
		</div>
		<div class="row align-items-center">
			<div class="col">
				<img class="p3" src="PIT_logo-removebg-preview.png"
					style="width: 150px; height: 100px;" alt="img">
			</div>
		</div>
		<div class="row">
			<div class="col text-center">
				<pre class="display-3 font-weight-bold fs-3" id="heading">&nbsp;</pre>
			</div>
		</div>
	</nav>
</div>

<script>
	
  // The text you want to type out
  const headingText = "Student Startup Registration";
 const faintColors = [
    'rgba(255, 165, 0, 0.1)', 
    'rgba(255, 192, 203, 0.1)', 
    'rgba(165, 42, 42, 0.1)', 
    'rgba(255, 0, 255, 0.1)', 
    'rgba(0, 255, 255, 0.1)', 
    'rgba(255, 255, 0, 0.1)', 
    'rgba(255, 140, 0, 0.1)', 
    'rgba(128, 0, 128, 0.1)', 
    'rgba(128, 0, 0, 0.1)', 
    'rgba(0, 128, 128, 0.1)'
];
  const heading = document.getElementById("heading");
  
  let index = 0;
  let colorIndex = 0;
  
  function typeHeading() {
    // If there are still more characters to type out
    if (index < headingText.length) {
      // Get the current character
      const char = headingText.charAt(index);
      
    
        // Increment the index and color index
      index++;
//      colorIndex = (colorIndex + Math.random()) % colors.length;
if(index == 1)
      colorIndex = Math.floor(Math.random() * faintColors.length);
else
	{}
	
// Add the character to the heading element
if(char==" "){
	   heading.innerHTML += `<span class="rounded-5  m-auto" style="color:black;font-family: 'Source Code Pro', monospace;">${char}</span>`;
}else
heading.innerHTML += `<span class="rounded-3 border border-green m-auto" style="color:black;font-family: 'Source Code Pro', monospace;background-color:${faintColors[colorIndex]};">${char}</span>`;

      // Type out the next character after a short delay
      setTimeout(typeHeading, 100);
      
    }
    else {
        // Wait for 5 seconds
        setTimeout(function(){
          // Create a new interval that will decrease the opacity of the heading element
          let intervalId = setInterval(function() {
            // Get the current opacity
            let currentOpacity = window.getComputedStyle(heading).getPropertyValue("opacity");
            // Decrement the opacity by 0.1
            heading.style.opacity = currentOpacity - 0.1;
            // If the opacity is less than or equal to 0
            if (currentOpacity <= 0) {
              // Clear the interval
              clearInterval(intervalId);
              // Clear the heading element
              heading.innerHTML = "";
              // Reset the opacity
              heading.style.opacity = 1;
              // Reset the index
              index = 0;
              // Start typing out the heading text again
              typeHeading();
            }
          }, 100);
        }, 5000);
        }
    
  }
  
  // Start typing out the heading text
  typeHeading();
</script>
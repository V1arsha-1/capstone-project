window.onload = function () {
  const checkboxes = document.querySelectorAll('input[type="checkbox"]');

  // Simulate CI/CD pipeline steps
  setTimeout(() => {
    checkboxes[2].checked = true; // Test
  }, 2000);

  setTimeout(() => {
    checkboxes[3].checked = true; // Deploy
  }, 4000);
};

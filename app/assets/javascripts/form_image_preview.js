function preview() {
  const input = document.getElementById('garden_photo')
  document.getElementById('garden-preview').src = window.URL.createObjectURL(input.files[0])
  // frees memory --not strictly necessary bc it still gets flushed on page unload, but still better to have
  input.onload = function() {
    URL.revokeObjectURL(document.getElementById('garden-preview').src)
  }
}

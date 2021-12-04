function previewImage() {
  const target = this.event.target;
  const file = target.files[0];
  const reader  = new FileReader();
  if (file) {
    reader.readAsDataURL(file);
  }
  reader.onloadend = function () {
      const preview = document.querySelector("#preview")
      if(preview) {
          preview.src = reader.result;
      }
  }
}
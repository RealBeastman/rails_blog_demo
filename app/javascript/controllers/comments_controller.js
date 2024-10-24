import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  toggleForm(event) {
    console.log("I clicked the edit button.");
    event.preventDefault();
    event.stopPropagation();

    const formID = event.params["form"];
    const commentBodyID = event.params["body"];
    
    const form = document.getElementById(formID);
    form.classList.toggle("hidden");

    const commentBody = document.getElementById(commentBodyID);
    commentBody.classList.toggle("hidden");

  }
}

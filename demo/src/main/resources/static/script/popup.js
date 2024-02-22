// Função que abre o pop up
function abrirPopUp() {
  // Mostra o elemento que contém o pop up
  document.getElementById("div-pop-up").style.display = "block";
  // Mostra o elemento que cria o efeito de transparência na tela
  document.getElementById("overlay").style.display = "block";
}

// Função que fecha o pop up
function fecharPopUp() {
  // Esconde o elemento que contém o pop up
  document.getElementById("div-pop-up").style.display = "none";
  // Esconde o elemento que cria o efeito de transparência na tela
  document.getElementById("overlay").style.display = "none";
}


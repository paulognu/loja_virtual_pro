String getErrorString(String code) {
  switch (code.toUpperCase()) {
    case "INVALID-CREDENTIAL":
      return "Seu email e/ou senha são inválidos";
    case "USER-DISABLED":
      return "A conta esta x1desabilitada! Contate o administrador!";
    case "EMAIL-ALREADY-IN-USE":
      return "Este email já esta sendo utilizado";
    default:
      return "Um erro indefinido ocorreu";
  }
}

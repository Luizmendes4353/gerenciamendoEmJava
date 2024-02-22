<?php
$host = "localhost";
$dbname = "estoque";
$user = "root";
$password = "root";
$conexao = new mysqli($host, $user, $password, $dbname);

// verifica se a conexão foi bem sucedida 
if ($conexao->connect_error) {
    die("Erro ao conectar ao banco de dados:" . $conexao->connect_error);
}

// Recebe os dados do formulario via metodo POST
$id_produto = $_POST['$id_produto'];
$id_fornecedor = $_POST['$id_fornecedor'];
$quantidade = $_POST['quantidade'];
$valor_unitario = $_POST['valor_unitario'];
$data_entrada = $_POST['data_entrada'];
echo 'passou os dados do formulario';

// Valida os dados do formulario
if (empty($id_produto) || empty($id_fornecedor) || empty($quantidade) || empty($valor_unitario) || empty($data_entrada)) {
    die("Erro: todos os campos são obrigatórios");
}

// indica que os campos tem que ser numericos
if (!is_numeric($id_produto) || !is_numeric($id_fornecedor) || !is_numeric($quantidade) || !is_numeric($valor_unitario)) {
    die("Erro: os campos id_produto, id_fornecedor, quantidade e valor_unitario devem ser numéricos");
}

if (!preg_match("/^\d{4}-\d{2}-\d{2}$/", $data_entrada)) {
    die("Erro: o campo data_entrada deve estar no formato aaaa-mm-dd");
}

// Prepara a consulta SQL para inserir os dados na tabela entrada_produto
$sql = "INSERT INTO entrada_produto (id_produto, id_fornecedor, quantidade, valor_unitario, data_entrada) VALUES (?, ?, ?, ?, ?)";
$stmt = $conexao->prepare($sql);

// Vincula os parâmetros à consulta SQL
$stmt->bind_param("iiids", $id_produto, $id_fornecedor, $quantidade, $valor_unitario, $data_entrada);

// Executa a consulta SQL
if (!$stmt->execute()) {
    die("Erro ao inserir os dados na tabela entrada_produto: " . $stmt->error);
}

// Fecha a conexão ao banco de dados
$conexao->close();

// Exibe uma mensagem de sucesso
echo "Dados inseridos com sucesso na tabela entrada_produto";
?>
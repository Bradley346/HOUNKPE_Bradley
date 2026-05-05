<?php


session_start();
if (!isset($_SESSION['IDuser'])) {
    header("Location: login.php");
    exit();
}

$host = "localhost";
$dbname = "magasin";
$user = "root";
$password = "";

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Erreur connexion : " . $e->getMessage());
}


$req_articles = $pdo->query("SELECT IDarticle, designation, prix FROM article");
$articles = $req_articles->fetchAll();

?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Effectuer une commande</title>
     <link rel="stylesheet" href="style.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@400;600;700&family=Inter:wght@400;500&display=swap" rel="stylesheet">
</head>
<body>

<h2>Nouvelle Vente</h2>
<button><a href="index.php">← Retour</a></button>


<div class="contener">
    <form action="traitement_commande.php" method="POST">

    <h3>--- Informations Client ---</h3>

    <label>Nom :</label><br>
    <input type="text" name="nom" required><br><br>

    <label>Prénom :</label><br>
    <input type="text" name="prenom" required><br><br>

    <label>Email :</label><br>
    <input type="email" name="mail"><br><br>

    <label>Adresse :</label><br>
    <input type="text" name="adresse"><br><br>

    <label>Âge :</label><br>
    <input type="number" name="age"><br><br>

    <label>Ville :</label><br>
    <input type="text" name="ville"><br><br>

    <h3>--- Articles commandés ---</h3>

    <table border="1" id="tableau_articles">
        <tr>
            <th>Article</th>
            <th>Quantité</th>
            <th>Action</th>
        </tr>
        <tr>
            <td>
            <select name="idarticle[]" required>
            <?php foreach ($articles as $art): ?>
                    <option value="<?= $art['IDarticle'] ?>">
                        <?= $art['designation'] ?>
                    </option>
                <?php endforeach; ?>
            </select>
            </td>     <td><input type="number" name="qte[]" min="1" value="1" required></td>
            <td><button type="button" onclick="supprimerLigne(this)">❌</button></td>
        </tr>
    </table>

    <br>
    <button type="button" onclick="ajouterLigne()">➕ Ajouter un article</button>
    <br><br>

    <label>Date de commande :</label><br>
    <input type="date" name="date" required><br><br>

    <input type="submit" value="✅ Valider la commande">

</form>
</div>
<script>
function ajouterLigne() {
    const table = document.getElementById("tableau_articles");
    const newRow = table.insertRow();
    const selectOriginal = table.rows[1].querySelector("select").cloneNode(true);
    
    newRow.innerHTML = `
        <td></td>
        <td><input type="number" name="qte[]" min="1" value="1" required></td>
        <td><button type="button" onclick="supprimerLigne(this)">❌</button></td>
    `;
    newRow.cells[0].appendChild(selectOriginal);
}

function supprimerLigne(btn) {
    const row = btn.closest("tr");
    const table = document.getElementById("tableau_articles");
    if (table.rows.length > 2) {
        row.remove();
    } else {
        alert("Il faut au moins un article !");
    }
}
</script>
</body>
</html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@400;600;700&family=Inter:wght@400;500&display=swap"
        rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>
    <title>Login</title>
</head>
<body>

<h2>Ajouter un utilisateur</h2>

<?php
if (isset($_GET['success'])) echo "<p style='color:green'>Utilisateur ajouté !</p>";
if (isset($_GET['error']))   echo "<p style='color:red'>Erreur : " . $_GET['error'] . "</p>";
?>

<div class="contener">
    <form action="traitement_ajout_user.php" method="POST">

    <label>Nom :</label><br>
    <input type="text" name="nom" required><br><br>

    <label>Prénom :</label><br>
    <input type="text" name="prenom" required><br><br>

    <label>Age :</label><br>
    <input type="number" name="age"><br><br>

    <label>Mail :</label><br>
    <input type="email" name="mail"><br><br>

    <label>Ville :</label><br>
    <input type="text" name="ville"><br><br>

    <label>Contact :</label><br>
    <input type="text" name="contact"><br><br>

    <label>Login :</label><br>
    <input type="text" name="login" required><br><br>

    <label>Mot de passe :</label><br>
    <input type="password" name="password" required><br><br>

    <input type="submit" value="✅ Ajouter">
    <a href="users.php"><button type="button">← Retour</button></a>

</form>
</div>

</body>
</html>
<?php
$host     = "localhost";
$dbname   = "magasin";
$user     = "root";
$password = "";

$pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $password);

$nom     = $_POST['nom'];
$prenom  = $_POST['prenom'];
$age     = intval($_POST['age']);
$mail    = $_POST['mail'];
$ville   = $_POST['ville'];
$contact = $_POST['contact'];
$login   = $_POST['login'];
$pass    = $_POST['password'];

// Vérifier si le login existe déjà
$req_check = $pdo->prepare("SELECT IDuser FROM user WHERE login = ?");
$req_check->execute([$login]);

if ($req_check->rowCount() > 0) {
    header("Location: ajout_user.php?error=Login+deja+utilise");
    exit();
}

// Insérer le nouvel utilisateur
$req = $pdo->prepare("INSERT INTO user (nom, prénom, age, mail, ville, contact, login, password) 
                      VALUES (?, ?, ?, ?, ?, ?, ?, ?)");

if ($req->execute([$nom, $prenom, $age, $mail, $ville, $contact, $login, $pass])) {
    header("Location: users.php?success=1");
} else {
    header("Location: ajout_user.php?error=Erreur+insertion");
}
exit();
?>
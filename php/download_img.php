<?php
session_start();
include('database_connect.php');
if (!isset($_SESSION['loggedin'])) {
	header('Location: index.php');
	exit;
}
$stmt = $con->prepare('SELECT product_name, product_img, user_id FROM sales_record WHERE id = ?');
$stmt->bind_param('i', $_GET['id']);
$stmt->execute();
$stmt->bind_result($product_name, $get_img_link, $user_id);
$stmt->fetch();
$stmt->close();

if ($_SESSION['id'] == $user_id){

    # Original file path
    $filePath = '../'.$get_img_link;

    # Get file extension type
    $file = new SplFileInfo($filePath);
    $extension  = $file->getExtension();

    # File type
    $contentType="application/octet-stream";

    # Rename the file
    $newFileName = $product_name;

    if (file_exists($filePath)) { //If the file exist
        header("Pragma: public");
        header("Expires: 0");
        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
        header("Cache-Control: public");
        header("Content-Description: File Transfer");
        header("Content-Type: " . $contentType);
        header("Content-Length: " .(string)(filesize($filePath)) );
        header("Content-Transfer-Encoding: binary\n");

        # Download the file
        header('Content-Disposition: attachment; filename="' . $newFileName . '.' . $extension . '"');

        # Output
        readfile($filePath);

        exit();
    } else {
        $error = "Failed to download the file.";
        $_SESSION["error"] = $error;
        header("location: ../view_order_record.php?id=" .$_SESSION['id']);
        exit;
    }
} else {
    $error = "No permission";
    $_SESSION["error"] = $error;
    header("location: ../view_order_record.php?id=" .$_SESSION['id']);
    exit;
}

?>
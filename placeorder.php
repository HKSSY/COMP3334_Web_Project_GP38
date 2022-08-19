<?=template_header('Place Order')?>
<?php
session_start();
if (!isset($_SESSION['loggedin'])) {
	header('Location: login.php');
	exit;
}
// Check the session variable for products in cart
$products_in_cart = isset($_SESSION['cart']) ? $_SESSION['cart'] : array();
// If there are no products in the cart
if ($products_in_cart) {
	
}else{
	$_SESSION["payment_done"] = "done";
	header('Location: index.php?page=cart');
    exit;
}
date_default_timezone_set('Asia/Hong_Kong'); // Set time zone
$current_month_year = date('Y-m');
$check_current_month_year = date('Y-m' , strtotime( $d . " +1 month")); //add one month for verification

$month = ($_POST['card_exp']);
$temp = new DateTime($month.'-01');
$exp_month_year = $temp->format('Y-m');

// Redirect to the success payment page if finished the checking
if($_SERVER['REQUEST_METHOD']=='POST'){
	if(isset($_POST) and !empty($_POST)){
		header('Location: index.php?page=success_payment');
	}
}
?>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<div class="placeorder content-wrapper">
	<h1>Payment method</h1>
	<p>Thank you for ordering with us, Please input your contact information</p>
	<h2> Please select your payment</h2>
	<div class="row">
	  <div class="col-75">
	    <div class="payment_container">
	      <form action="index.php?page=placeorder" method="post" class="row g-3 needs-validation">
	        <label for="fname" style="font-size: 30px;">Accepted Cards</label>
	        <div class="icon-container" style="font-size: 30px;">
	            <i class="fa fa-cc-visa" style="color:navy;"></i>
	            <i class="fa fa-cc-amex" style="color:blue;"></i>
	            <i class="fa fa-cc-mastercard" style="color:red;"></i>
	            <i class="fa fa-cc-discover" style="color:orange;"></i>
	        </div>
			  <div class="form-group owner">
	            <label for="fname"><i class="fa fa-user"></i> Contact Name</label>
	            <input type="text" class="form-control" id="owner" name="owner" placeholder="Chan Tai Man" required>
		      </div>
		      <div class="form-group address">
	            <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
	            <input type="text" class="form-control" id="adr" name="adr" placeholder="Your delivery address" required>
		      </div>
	  	        <div class="form-group" id="card-number-field">
		            <label for="cardNumber">Card Number</label>
		            <input type="number" class="form-control" id="cardNumber" placeholder="1111-2222-3333-4444" minlength="16" maxlength="16" required>
		        </div>
		      <div class="form-group CVV">
		          <label for="cvv">CVV</label>
		          <input type="number" class="form-control" id="cvv" placeholder="xxx" minlength="3" maxlength="3" required>
		      </div>
		        <div class="form-group Expdate">
	              <div class="col-100">
	                <label for="expdate">Exp month</label>
	                <input type="month" id="expdate" name="expdate" min="<?php echo $check_current_month_year;?>" max="2047-12" placeholder="mm-yyyy" required>
	              </div>
		        </div>
	        <div class="form-group" id="pay-now">
	            <button type="submit" class="btn btn-primary" id="confirm-purchase">Confirm</button>
	        </div>
	      </form>
	    </div>
	  </div>
	</div>
</div>

<!-- Connect to javascript-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<?=template_footer()?>
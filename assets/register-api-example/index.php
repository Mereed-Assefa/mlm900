<?php
	if (isset($_POST['action'])) {
		$json = CallApi('https://your-site-domain.com/api/register',$_POST);
		echo json_encode($json);die;
	}

	function CallApi($url, $data = array()){
	    $curl = curl_init($url);
	    $request = http_build_query($data);
	    curl_setopt($curl, CURLOPT_POST, true);
	    curl_setopt($curl, CURLOPT_POSTFIELDS, $request);
	    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
	    curl_setopt($curl, CURLOPT_HEADER, false);
	    curl_setopt($curl, CURLOPT_TIMEOUT, 60);
	    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
	   
	    $response = json_decode(curl_exec($curl),1);
	    $httpcode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
	    curl_close($curl);

	    return $response;
	}

	$field = CallApi('https://your-site-domain.com/api/register_custom_field');

	if (!isset($field)) {
		echo "Error in API";die;
	}

	$fields = array();
	$email = isset($user) ? $user['email'] : '';
	$fields['email'] = '<div class="form-group">
		<label for="email">Email</label>
		<input type="email" name="email" placeholder="Email" class="form-control" value="'. $email .'">  
	</div>';

	$firstname = isset($user) ? $user['firstname'] : '';
	$fields['firstname'] = '<div class="form-group">
		<label for="firstname">First Name</label>
		<input type="text" name="firstname" id="firstname" class="form-control" placeholder="Last Name" value="'. $firstname .'" >
	</div>';

	$lastname = isset($user) ? $user['lastname'] : '';
	$fields['lastname'] = '<div class="form-group">
		<label for="lastname">Last Name</label>
		<input type="text" name="lastname" id="lastname" class="form-control" placeholder="Last Name" value="'. $lastname .'">
	</div>';

	$username = isset($user) ? $user['username'] : '';
	$fields['username'] = '<div class="form-group">
		<label for="username">Username</label>
		<input type="text" name="username" id="username" class="form-control" placeholder="Username" value="'. $username .'">
	</div>';


	$fields['password'] = '<div class="form-group">
		<label for="password">Password</label>
		<input type="password" name="password" id="password" placeholder="Password" class="form-control">
	</div>';
	$fields['confirm_password'] = '<div class="form-group">
		<label for= "cpassword" >Confirm Password</label>
		<input type= "password" name= "cpassword" id= "cpassword" placeholder="Confirm Password" class="form-control">
	</div>';

	$customValue = json_decode(isset($user['value']) ? $user['value'] : '[]', 1);

	$requiredFields = [];
	$requiredFields[] = ['type' => 'header','label'=>'firstname'];
	$requiredFields[] = ['type' => 'header','label'=>'lastname'];
	$requiredFields[] = ['type' => 'header','label'=>'email'];
	$requiredFields[] = ['type' => 'header','label'=>'username'];
	$requiredFields[] = ['type' => 'header','label'=>'password'];
	$requiredFields[] = ['type' => 'header','label'=>'confirm_password'];

	$all_fields = array_merge($requiredFields,$field['fields']);

?>

<meta name=viewport content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<nav class="navbar navbar-expand-lg mb-5 navbar-light bg-light">
	<div class="container">
		<a class="navbar-brand" href="#">Navbar</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active">
					<a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Features</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Pricing</a>
				</li>
				<li class="nav-item">
					<a class="nav-link disabled" href="#">Disabled</a>
				</li>
			</ul>
		</div>
	</div>
</nav>

<div class="container">
	<div class="col-sm-3"></div>
	<div class="col-sm-6">
		<form id="reg_form">
			<input type="hidden" name="action" value="do_reg">
			<?php foreach ($all_fields as $key => $value) { 

				$required    = (isset($value['required']) && $value['required'] == 'true') ? 'required="required"' : '';
				$label       = (isset($value['label']) && $value['label'] ) ? $value['label'] : '';
				$placeholder = (isset($value['placeholder']) && $value['placeholder'] ) ? $value['placeholder'] : '';
				$className   = (isset($value['className']) && $value['className'] ) ? $value['className'] : '';
				$name        = ((isset($value['name']) && $value['name'] ) ? $value['name'] : '');
				$ivalue      = (isset($value['value']) && $value['value'] ) ? $value['value'] : (isset($customValue[$name]) ? $customValue[$name] : '');
				$maxlength   = (isset($value['maxlength']) && $value['maxlength'] ) ? $value['maxlength'] : '';
				$min         = (isset($value['min']) && $value['min'] ) ? $value['min'] : '';
				$max         = (isset($value['max']) && $value['max'] ) ? $value['max'] : '';
				$mobile_validation         = (isset($value['mobile_validation']) && $value['mobile_validation'] ) ? $value['mobile_validation'] : '';
				$_customValue = $ivalue;

				switch ($value['type']) {
					case 'header': 
					echo  $fields[strtolower($label)]; 
					if($label == 'Email' && isset($allow_vendor_option)){
						echo  $fields['is_vendor']; 
					}
					break;
					case 'text': ?>
						<?php if($mobile_validation == 'true'){ ?>
							<link rel="stylesheet" href="assets/css/intlTelInput.css">
							<script src="assets/js/intlTelInput.js"></script>

							<input type="hidden" name='<?= $name ?>' id="phonenumber-input" value="<?= $ivalue ?>" class="<?= $className ?>" placeholder="<?= $placeholder ?>" <?= $required ?> maxlength = '<?= $maxlength ?>' >

							<div class="form-group">
								<label for="<?= $name ?>"><?= $label ?></label>
								<div>
									<input id="phone" type="text" value="<?= $ivalue ?>">
								</div>
							</div>

							<script type="text/javascript">
								var tel_input = intlTelInput(document.querySelector("#phone"), {
								  initialCountry: "auto",
								  utilsScript: "assets/js/utils.js",
								  separateDialCode:true,
								  geoIpLookup: function(success, failure) {
								    $.get("https://ipinfo.io", function() {}, "jsonp").always(function(resp) {
								      var countryCode = (resp && resp.country) ? resp.country : "";
								      success(countryCode);
								    });
								  },
								});
							</script>
						<?php } else { ?>
							<div class="form-group">
								<label for="<?= $name ?>"><?= $label ?></label>
								<input type="text" name='<?= $name ?>' id="<?= $name ?>" value="<?= $ivalue ?>" class="<?= $className ?>" placeholder="<?= $placeholder ?>" <?= $required ?> maxlength = '<?= $maxlength ?>' >
							</div>
						<?php } ?> 
					<?php 
					break;
					case 'number': ?>
					<div class="form-group">
						<label for="<?= $name ?>"><?= $label ?></label>
						<input type="number" name="<?= $name ?>" id="<?= $name ?>" class="<?= $className ?>" value="<?= $ivalue ?>" min="<?= $min ?>" max="<?= $max ?>"  <?= $required ?> >
					</div>
					<?php 
					break;
					case 'textarea': ?>
					<div class="form-group">
						<label for="<?= $name ?>"><?= $label ?></label>
						<textarea name="<?= $name ?>" id="<?= $name ?>" class="<?= $className ?>" rows="3" <?= $required ?> maxlength = '<?= $maxlength ?>'><?= $ivalue ?></textarea>
					</div>
					<?php 
					break;
					case 'date': ?>
					<div class="form-group">
						<label class="control-label" for="input-date-available"><?= $label ?></label>
						<div class="input-group date" data-provide="datepicker">
							<input type="text" class="form-control <?= $className ?>" name="<?= $name ?>" value="<?= $ivalue ?>" placeholder="<?= $placeholder ?>" <?= $required ?>>
							<div class="input-group-addon">
								<span class="glyphicon glyphicon-th"></span>
							</div>
						</div>
					</div>
					<?php 
					break;
					case 'checkbox-group':
					if(isset($value['values'])){
						echo '<div class="form-group"><label>'.$label.'</label>';
						foreach ($value['values'] as $k => $v) {
							$label = (isset($v['label']) && $v['label'] ) ? $v['label'] : '';
							$ivalue = (isset($v['value']) && $v['value'] ) ? $v['value'] : '';
							$selected = (isset($value['selected']) && $value['selected'] ) ? "checked='checked'" : ($ivalue == $ivalue);
							?>

							<div class="checkbox">
								<label>
									<input type="checkbox" name="<?= $name ?>" value="<?= $ivalue ?>" <?= $selected ?> class="<?= $className ?>">
									<?= $label ?>
								</label>
							</div>
						<?php } ?>
					<?php } 
					break;
					case 'radio-group':
					if(isset($value['values'])){
						echo '<div class="form-group"><label>'.$label.'</label>';
						foreach ($value['values'] as $k => $v) {
							$label = (isset($v['label']) && $v['label'] ) ? $v['label'] : '';
							$ivalue = (isset($v['value']) && $v['value'] ) ? $v['value'] : '';
							$selected = (isset($v['selected']) && $v['selected'] ) ? "selected='selected'" : '';
							?>
							<div class="radio">
								<label>
									<input type="radio" name="<?= $name ?>" value="<?= $ivalue ?>" <?= $selected ?> class="<?= $className ?>">
									<?= $label ?>
								</label>
							</div>
						<?php } ?>
					</div>
				<?php } 
				break;
				case 'select':
				if(isset($value['values'])){ ?>
					<div class="form-group">
						<label for="<?= $name ?>"><?= $label ?></label>
						<select name="<?= $name ?>" id="<?= $name ?>" class="form-control">
							<?php 
							foreach ($value['values'] as $k => $v) {
								$label = (isset($v['label']) && $v['label'] ) ? $v['label'] : '';
								$ivalue = (isset($v['value']) && $v['value'] ) ? $v['value'] : '';
								$selected = '';
								if(isset($edit_view) && $_customValue == $ivalue) {
									$selected = "selected='selected'";
								} else if( !isset($edit_view) && isset($v['selected']) && $v['selected']){
									$selected = "selected='selected'";
								}
								?>
								<option value="<?= $ivalue ?>" <?= $selected ?>><?= $label ?></option>
							<?php } ?>
						</select>
					</div>
				<?php } 
				break;
			} ?>
		<?php } ?>

		<div class="form-group">
			<label class="checkbox">
				<input type="checkbox" name="terms"> Accept our terms and conditions
			</label>
		</div>

		<div class="form-group">
			<button type="submit" class="btn submit-button btn-primary">Submit</button>
		</div>
	</form>
</div>
</div>
<br><br><br>


<script type="text/javascript">
	$("#reg_form").submit(function(){
		var is_valid = true;

        if(typeof tel_input != 'undefined'){
            var errorMap = ["Invalid number", "Invalid country code", "Too short", "Too long", "Invalid number"];
            is_valid = false;
            var errorInnerHTML = '';
            if ($("#phone").val().trim()) {
                if (tel_input.isValidNumber()) {
                    is_valid = true;
                    $("#phonenumber-input").val("+"+tel_input.selectedCountryData.dialCode + $("#phone").val().trim())
                } else {
                    var errorCode = tel_input.getValidationError();
                    errorInnerHTML = errorMap[errorCode];
                }
            } else { errorInnerHTML = 'The Mobile Number field is required.'; }

            $("#phone").parents(".form-group").removeClass("has-error");
            $(".reg_form .text-danger").remove();
            if(!is_valid){
                $("#phone").parents(".form-group").addClass("has-error");
                $("#phone").parents(".form-group").find('> div').after("<span class='text-danger'>"+ errorInnerHTML +"</span>");
            }
        }

        if(is_valid){

			$this = $(this);
			$.ajax({
				type:'POST',
				dataType:'json',
				data:$this.serialize(),
				beforeSend:function(){
					$("#submit-button").prop("disabled",1);
				},
				complete:function(){
					$("#submit-button").prop("disabled",0);
				},
				success:function(json){
					$container = $this;
					$container.find(".is-invalid").removeClass("is-invalid");
					$container.find(".has-error").removeClass("has-error");
					$container.find("span.invalid-feedback,.text-danger").remove();

					if (json['success']) {
						swal(json['success'],{})
						.then(function(value) {
							window.location.reload();
						});
					}

					if(json['errors']){
						$.each(json['errors'], function(i,j){
							$ele = $container.find('[name="'+ i +'"]');
							if($ele){
								$ele.addClass("is-invalid");
								if($ele.parent(".input-group").length){
									$ele.parent(".input-group").after("<span class='invalid-feedback'>"+ j +"</span>");
								} else{
									$ele.after("<span class='invalid-feedback'>"+ j +"</span>");
								}
							}
						})
					}
				},
			})
		}

		return false;
	})
</script>
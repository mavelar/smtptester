<cfparam name="form.send" default="false">
<cfparam name="sent" default="false">
<cfparam name="smtpSSL" default="false">
<cfparam name="smtpTLS" default="false">

<cfset smtpSettings = {
	'server': "mail.smtp2go.com",
	'port': "2525",
	'username': "tmtoursonline",
	'password': "cndwZ3l6dmx3cHhr"
}>
<cfif form.send>
	<cftry>
		<cfmail to="#form.to#"
						from="#form.from#"
						subject="#form.subject#"
						server="#smtpSettings.server#"
						port="#smtpSettings.port#"
						username="#smtpSettings.username#"
						password="#smtpSettings.password#"
						usessl="#smtpSSL#"
						usetls="#smtpTLS#"
						type="html">
			<cfinclude template="templates/default.cfm">
		</cfmail>

		<cfset sent = true>
		<cfcatch type="any">
			<cfdump var="#cfcatch#" abort="true">
		</cfcatch>
	</cftry>
</cfif>

<cfoutput>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Testing SMTP</title>

    <!-- Bootstrap -->
    <!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  	<div class="container">
  		<div class="page-header">
  			<h1>Testing SMTP Sender</h1>
  		</div>

  		<cfif sent>
  			<div class="alert alert-success">
  				Email sent successfully!
  			</div>
  			<a href="./">Send another test</a>
	  	<cfelse>
	  		<div class="row">
	  			<form method="post" class="form">
	  				<div class="col-md-8">
				    	<div class="form-group">
			    			<label for="to">To</label>
								<input class="form-control" id="to" name="to" value="">
							</div>
							<div class="form-group">
			    			<label for="from">From</label>
								<input class="form-control" id="from" name="from" value="manuel@pixelcreart.net">
							</div>
							<div class="form-group">
			    			<label for="subject">Subject</label>
								<input class="form-control" id="subject" name="subject" value="">
							</div>
							<div class="form-group">
			    			<label for="body">Body</label>
								<textarea class="form-control" id="body" name="body"></textarea>
							</div>
							<button class="btn btn-default" name="send" value="true">Submit</button>
						</div>

						<div class="col-md-4">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">SMTP server settings</h3>
								</div>
								<div class="list-group">
									<cfloop collection="#smtpSettings#" item="setting">
										<div class="list-group-item">
											<div class="form-group">
							    			<label for="#setting#">#setting#</label>
												<input class="form-control" id="#setting#" name="#setting#" value="#smtpSettings[setting]#">
											</div>
										</div>
									</cfloop>

									<div class="list-group-item">
										<div class="form-group">
						    			<label for="useSSL">Use SSL</label>
											<input type="checkbox" class="form-control" id="useSSL" name="smtpSSL" value="true">
										</div>
									</div>
									<div class="list-group-item">
										<div class="form-group">
						    			<label for="useTLS">Use TLS</label>
											<input type="checkbox" class="form-control" id="useTLS" name="smtpTLS" value="true">
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
  		</cfif>
		</div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
  </body>
</html>
</cfoutput>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<style type="text/css">
body {
	background: linear-gradient(90deg, #BA68C8 0%, #AB47BC 100%)
}

.container {
	background-color: white;
	text-align: center;
	border-radius: 20px;
	box-shadow: 0 20px 40px rgba(0, 0, 0, .2);
	margin-bottom: 50px
}

.title {
	font-size: 25px;
	font-weight: 100
}

.icon {
	position: relative;
	bottom: 11px
}

.mt-100 {
	margin-top: 100px
}

.profile img {
	width: 68px;
	height: 68px;
	border-radius: 50%
}

.card {
	border-radius: 15px;
	margin-left: 30px;
	margin-right: 30px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, .2)
}

.card-body {
	position: relative;
	bottom: 35px
}

.btn {
	margin-top: 36px;
	margin-bottom: 45px;
	background-color: #AB47BC;
	border: none;
	color: #fff
}

.btn:hover {
	-webkit-transform: scale(1.05);
	-ms-transform: scale(1.05);
	transform: scale(1.05);
	color: #fff
}

.header {
	padding-top: 40px
}
</style>
</head>
<body>
	<!-- Title -->
	<section class="small-section bg-dark-alfa-50"
		data-background="images/full-width-images/section-bg-19.jpg">
		<div class="container relative">
			<div class="row">
				<div class="col-md-8">
					<div class="wow fadeInUpShort" data-wow-delay=".1s">
						<h1 class="hs-line-7 mb-20 mb-xs-10">STUDY</h1>
					</div>
					<div class="wow fadeInUpShort" data-wow-delay=".2s">
						<p class="hs-line-6 opacity-075 mb-20 mb-xs-0">스터디 신청자</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Title -->

	<div class='container mx-auto mt-5 col-md-10 mt-100'>
		<div class="header">
			<div class="title">Opinions Matter</div>
			<p>
				<small class="text-muted">We are a homegrown, globally
					connected, <br />
				<u>Experimental</u> HUB that prides itself on its <u>Creativity</u><br />
					and <u>Innovation.</u>
				</small>
			</p>
		</div>
		<div class="row" >
			<div class="card col-md-3 mt-100">
				<div class="card-content">
					<div class="card-body p-0">
						<div class="profile">
							<img src="https://i.imgur.com/J6l19aF.jpg">
						</div>
						<div class="card-title">
							Angelina Frederic<br /> <small>Head of marketing at K
								mart</small>
						</div>
						<div class="card-subtitle">
							<p>
								<small class="text-muted"> I expected anything less than
									perfect for the team of experts. They are the best team ever! </small>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="card col-md-3 mt-100">
				<div class="card-content">
					<div class="card-body p-0">
						<div class="profile">
							<img src="https://i.imgur.com/8RKXAIV.jpg">
						</div>
						<div class="card-title">
							Jackson Totham<br /> <small>CEO of Redbull</small>
						</div>
						<div class="card-subtitle">
							<p>
								<small class="text-muted"> I really enjoyed working with
									them, they are Group of Professionals and they know what
									they're Doing </small>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="card col-md-3 mt-100">
				<div class="card-content">
					<div class="card-body p-0">
						<div class="profile">
							<img src="https://i.imgur.com/Ur43esv.jpg">
						</div>
						<div class="card-title">
							David Gregory<br /> <small>Resident Dj at ibdc</small>
						</div>
						<div class="card-subtitle">
							<p>
								<small class="text-muted"> I always wanted cool videos
									of my concerts never knew whom to talk to but they are amazing!
								</small>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="ft">
			<div class="btn btn-outline">Tell a nice word</div>
		</div>
	</div>
</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-03-25
  Time: 오전 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="resources"
	value="${pageContext.request.contextPath}/resources" />
	
	<!-- Home Section -->
		<section class="home-section bg-dark light-content" id="home">
			<div class="container min-height-100vh d-flex align-items-center pt-100 pb-100">
				<div class="split-background d-none d-lg-block d-xl-block"></div>

	<!-- Hero Content -->
		<div class="home-content text-start">
			<div class="row">

				<div class="col-lg-5 d-flex align-items-center mb-md-60">
					<div>
						<h1 class="hs-line-10 uppercase mb-30 mb-xs-10 wow fadeInUpShort"
							data-wow-delay=".1s">STUDY</h1>
						<h2 class="hs-line-7 mb-60 mb-xs-40 wow fadeInUpShort"
							data-wow-delay=".2s">
							Developer Study<span class="sr-only">Challenge, Passion, cooperation</span>
							<span data-period="2800" data-type='[ "Challenge", "Passion", "cooperation"]' class="typewrite" aria-hidden="true">
							<span class="wrap"></span></span>
						</h2>
						<div class="local-scroll wow fadeInUpShort" data-wow-delay=".3s">
							<a href="#about" class="btn btn-mod btn-w btn-medium btn-round mx-md-1">See More</a>
							<a href="pages-services-1-dark.html" class="btn btn-mod btn-w btn-medium btn-round mx-md-1">Get Pricing</a>
						</div>
					</div>
				</div>
				<div class="split-image col-lg-6 offset-lg-1 d-flex align-items-center parallax" data-offset="20">
					<img src="${resources }/images/studyimg/study_img2.jpg" alt="Add Image Description Here" class="wow fadeScaleIn" />
				</div>
			</div>
		</div>
		<!-- End Hero Content -->
			<!-- Scroll Down -->
				<div class="local-scroll scroll-down-wrap wow fadeInUpShort"
					data-wow-offset="0">
					<a href="#about" class="scroll-down"><i class="scroll-down-icon"></i>
					<span class="sr-only">Scroll to the next section</span></a>
				</div>
		<!-- End Scroll Down -->
		</div>
	</section>
	<!-- Promo Section -->
	<section class="page-section bg-dark light-content" id="about">
		<div class="container relative">
			<div class="mb-120 mb-sm-50">
				<div class="row section-text">
					<div class="col-md-12 col-lg-4 mb-md-50 mb-xs-30">
						<div class="lead-alt wow linesAnimIn" data-wow-offset="0"
							data-splitting="lines">더 좋은 개발자가 되기 위한 도전</div>
					</div>
					<div class="col-md-6 col-lg-4 mb-sm-50 mb-xs-30 wow linesAnimIn"
						data-wow-offset="0" data-splitting="lines">You are the sum total of everything you've ever seen, heard, eaten, smelled, been told, forgot --  it's all there. Everything influences each of us, and because of that I try to make sure that my experiences are positive</div>
					<div class="col-md-6 col-lg-4 mb-sm-50 mb-xs-30 wow linesAnimIn"
						data-wow-offset="0" data-splitting="lines">I owe my success to having listened respectfully to the very best advice, and then going away and doing the exact opposite</div>
				</div>
			</div>
		</div>
		</div>
	</section>
		<!-- End Promo Section -->
	
		<hr class="mt-0 mb-0 white" />
		<!-- Services Section -->
			<section class="page-section bg-dark light-content" id="services">
				<div class="container relative">
					<div class="text-center mb-80 mb-sm-50">
						<h2 class="section-title">목록</h2>
						<p class="section-title-descr">We provide the best digital solutions.</p>
					</div>
			<!-- Services Grid -->
				<div class="row services-grid">
					<!-- Services Item -->
					<div class="col-sm-6 col-md-4 col-lg-4">
						<div class="services-item text-center wow fadeIn" data-wow-delay="0"
							data-wow-duration="1.5s">
							<div class="services-icon">
								<svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false"
									xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd">
		                           <path d="M13.5 20c-1.104 0-2 .896-2 2s.896 2 2 2 2-.896 2-2-.896-2-2-2zm-10.551 4c-.598 0-2.429-1.754-2.747-4.304-.424-3.414 2.124-5.593 4.413-5.87.587-1.895 2.475-4.684 6.434-4.77.758-1.982 3.409-4.507 6.84-3.186 1.647.634 3.101 2.101 3.705 3.737.231.624-.71.965-.937.347-.51-1.378-1.737-2.615-3.127-3.151-2.577-.99-4.695.731-5.422 2.298 1.107.12 2.092.455 2.755.889.909.594 1.473 1.558 1.508 2.577.031.889-.33 1.687-.991 2.187-.654.496-1.492.643-2.298.404-.966-.286-1.748-1.076-2.143-2.169-.287-.793-.384-1.847-.178-2.921-3.064.185-4.537 2.306-5.075 3.742 1.18.102 2.211.574 2.831 1.012.959.676 1.497 1.6 1.513 2.599.015.859-.363 1.664-1.011 2.155-.608.46-1.535.599-2.363.348-.961-.289-1.7-1.041-2.079-2.118-.255-.723-.375-1.776-.204-2.919-1.631.361-3.512 1.995-3.178 4.685.18 1.448 1.008 2.888 2.015 3.502.43.261.242.926-.261.926zm10.551-1c-.552 0-1-.448-1-1s.448-1 1-1 1 .448 1 1-.448 1-1 1zm8.011-6.801l2.489.459-1.744 1.833.333 2.509-2.283-1.092-2.283 1.092.333-2.509-1.744-1.833 2.489-.459 1.205-2.225 1.205 2.225zm-1.759.897l-1.143.21.801.843-.153 1.152 1.049-.501 1.049.501-.153-1.152.801-.843-1.143-.21-.554-1.022-.554 1.022zm-14.345-2.3c-.202 1.024-.128 1.993.113 2.678.347.984.966 1.355 1.424 1.492.604.183 1.175.036 1.472-.187.388-.294.624-.808.614-1.34-.011-.673-.398-1.313-1.09-1.801-.545-.385-1.479-.803-2.533-.842zm6.373-4.716c-.226 1.018-.11 1.99.099 2.569.287.79.828 1.356 1.486 1.55.501.148 1.014.06 1.411-.242.398-.301.615-.795.596-1.355-.025-.705-.409-1.353-1.056-1.775-.511-.334-1.448-.657-2.536-.747zm-5.812-7.369l3.032.558-2.124 2.234.405 3.057-2.781-1.331-2.781 1.331.405-3.057-2.124-2.234 3.032-.558 1.468-2.711 1.468 2.711zm-2.285.897l-1.686.31 1.182 1.243-.226 1.7 1.547-.74 1.547.74-.226-1.7 1.182-1.243-1.686-.31-.817-1.508-.817 1.508zm17.817-3.608c-1.38 0-2.5 1.12-2.5 2.5s1.12 2.5 2.5 2.5 2.5-1.12 2.5-2.5-1.12-2.5-2.5-2.5zm0 4c-.828 0-1.5-.672-1.5-1.5s.672-1.5 1.5-1.5 1.5.672 1.5 1.5-.672 1.5-1.5 1.5z" />
		                        </svg>
							</div>
							
							<h3 class="services-title">Branding</h3>
							<div class="services-descr">Lorem ipsum dolor sit amet, rembe
								adipiscing elite. Inwege maximus ligula semper metusere
								pellentesque mattis. Maecenas volutpat, diam enime volutpa.</div>
							<div class="services-more">
								<a href="#" class="text-link">Learn More</a>
							</div>
						</div>
					</div>
					<!-- End Services Item -->
		
					<!-- Services Item -->
					<div class="col-sm-6 col-md-4 col-lg-4">
						<div class="services-item text-center wow fadeIn"
							data-wow-delay=".1s" data-wow-duration="1.5s">
							<div class="services-icon">
								<svg width="24" height="24" viewBox="0 0 24 24"
									fill="currentColor" aria-hidden="true" focusable="false"
									xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd"
									clip-rule="evenodd">
		                              <path d="M5 22h4v-3h-9v-18h24v18h-10v3h4v1h-13v-1zm5-3v3h3v-3h-3zm13-17h-22v16h22v-16z" />
		                         </svg>
							</div>
							<h3 class="services-title">Web Desing</h3>
							<div class="services-descr">Proin fringilla augue at maximus
								vestibulum. Nam pulvitaere neque et porttitor. Praesent sed nisi
								eleifend lorem fermentum ac ante lorem ipsum sit amet.</div>
							<div class="services-more">
								<a href="#" class="text-link">Learn More</a>
							</div>
						</div>
					</div>
					<!-- End Services Item -->
		
					<!-- Services Item -->
					<div class="col-sm-6 col-md-4 col-lg-4">
						<div class="services-item text-center wow fadeIn"
							data-wow-delay=".2s" data-wow-duration="1.5s">
							<div class="services-icon">
								<svg width="24" height="24" viewBox="0 0 24 24"
									fill="currentColor" aria-hidden="true" focusable="false"
									xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd"
									clip-rule="evenodd">
		                            <path d="M24 23h-20c-2.208 0-4-1.792-4-4v-15.694c.313-1.071 1.285-2.306 3-2.306 1.855 0 2.769 1.342 2.995 2.312l.005 1.688h18v18zm-1-17h-17v13s-.665-1-2-1c-1.104 0-2 .896-2 2s.896 2 2 2h19v-16zm-18-2.68c-.427-.971-1.327-1.325-2-1.32-.661.005-1.568.3-2 1.32v16.178c.394-1.993 2.245-2.881 4-2.401v-13.777zm15 15.68h-12v-10h12v10zm-8-9h-3v8h10v-4h-2v3h-1v-3h-3v3h-1v-7zm7 0h-6v3h6v-3z" />
		                       </svg>
							</div>
							
							<h3 class="services-title">스터디 모임찾기</h3>
							<div class="services-descr">Ember adipiscing elite curabitur
								iaculis accumsan augu nec finibus mauris pretium eu. Duis placerat
								ex gravida nibh tristique ultricies eros lorem blandit.</div>
							<div class="services-more">
								<a href="#" class="text-link">Learn More</a>
							</div>
						</div>
					</div>
					<!-- End Services Item -->
		
					<!-- Services Item -->
					<div class="col-sm-6 col-md-4 col-lg-4">
						<div class="services-item text-center wow fadeIn"
							data-wow-delay=".0s" data-wow-duration="1.5s">
							<div class="services-icon">
								<svg width="24" height="24" viewBox="0 0 24 24"
									fill="currentColor" aria-hidden="true" focusable="false"
									xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd"
									clip-rule="evenodd">
		                               <path d="M9.484 15.696l-.711-.696-2.552 2.607-1.539-1.452-.698.709 2.25 2.136 3.25-3.304zm0-5l-.711-.696-2.552 2.607-1.539-1.452-.698.709 2.25 2.136 3.25-3.304zm0-5l-.711-.696-2.552 2.607-1.539-1.452-.698.709 2.25 2.136 3.25-3.304zm10.516 11.304h-8v1h8v-1zm0-5h-8v1h8v-1zm0-5h-8v1h8v-1zm4-5h-24v20h24v-20zm-1 19h-22v-18h22v18z" />
		                         </svg>
							</div>
							
							<h3 class="services-title">Research</h3>
							<div class="services-descr">Maecenas volutpat, diam enime
								volutpa. Cras luctus interdum sodales. Quisque quis odio dui.
								Sedes amet neque malesuada, lobortis commodo magna tese.</div>
							<div class="services-more">
								<a href="#" class="text-link">Learn More</a>
							</div>
						</div>
					</div>
					<!-- End Services Item -->
		
					<!-- Services Item -->
					<div class="col-sm-6 col-md-4 col-lg-4">
						<div class="services-item text-center wow fadeIn"
							data-wow-delay=".1s" data-wow-duration="1.5s">
							<div class="services-icon">
								<svg width="24" height="24" viewBox="0 0 24 24"
									fill="currentColor" aria-hidden="true" focusable="false"
									xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd"
									clip-rule="evenodd">
		                        <path d="M15 7h4v5h5v6h-5v5h-19v-21h15v5zm-5 11h-9v4h9v-4zm8 0h-7v4h7v-4zm-11-5h-6v4h6v-4zm9 0h-8v4h8v-4zm7 0h-6v4h6v-4zm-12-5v4h7v-4h-7zm-1 0h-9v4h9v-4zm-3-5h-6v4h6v-4zm7 0h-6v4h6v-4z" />
		                 		</svg>
							</div>
							
							<h3 class="services-title">Development</h3>
							<div class="services-descr">Fusce aliquet quam eget neque
								ultrices elementm. Nullarec posuere felis id arcu blandit sagittis
								sit amet lorem nectus ultricies ullamcorper vulputate.</div>
							<div class="services-more">
								<a href="#" class="text-link">Learn More</a>
							</div>
						</div>
					</div>
					<!-- End Services Item -->
		
					<!-- Services Item -->
					<div class="col-sm-6 col-md-4 col-lg-4">
						<div class="services-item text-center wow fadeIn"
							data-wow-delay=".2s" data-wow-duration="1.5s">
							<div class="services-icon">
								<svg width="24" height="24" viewBox="0 0 24 24"
									fill="currentColor" aria-hidden="true" focusable="false"
									xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd"
									clip-rule="evenodd">
		                           <path d="M14.889 23.652c-.923.227-1.888.348-2.881.348-6.627 0-12.008-5.377-12.008-12s5.381-12 12.008-12c6.628 0 12.009 5.377 12.009 12 0 1.027-.13 2.023-.373 2.975l-.965-.34c.21-.847.321-1.732.321-2.643 0-6.066-4.929-10.992-11-10.992s-11 4.926-11 10.992c0 6.067 4.929 10.993 11 10.993.887 0 1.751-.106 2.577-.304l.312.971zm-2.889-13.652c-1.104 0-2 .896-2 2s.896 2 2 2c.28 0 .546-.057.788-.162l3.06 9.525 2.174-3.622 4.116 4.259 1.879-1.828-4.087-4.216 3.671-1.926-9.694-3.426c.06-.19.093-.393.093-.604 0-1.104-.896-2-2-2zm1.768 3.615l7.333 2.597-2.823 1.481 4.324 4.461-.445.431-4.324-4.473-1.716 2.86-2.349-7.357zm.049 6.692c-.583.126-1.188.193-1.809.193-4.691 0-8.5-3.809-8.5-8.5s3.809-8.5 8.5-8.5c4.692 0 8.5 3.809 8.5 8.5 0 .619-.066 1.222-.192 1.803l-.959-.337c.094-.474.143-.964.143-1.466 0-4.139-3.361-7.5-7.5-7.5-4.139 0-7.5 3.361-7.5 7.5 0 4.139 3.361 7.5 7.5 7.5.517 0 1.022-.052 1.51-.152l.307.959zm-1.076-3.36c-.239.035-.484.053-.733.053-2.759 0-5-2.24-5-5s2.241-5 5-5c2.76 0 5 2.24 5 5 0 .212-.013.421-.039.626l-.979-.345.01-.281c0-2.208-1.792-4-4-4s-4 1.792-4 4 1.792 4 4 4l.43-.023.311.97zm-.741-5.947c.552 0 1 .448 1 1s-.448 1-1 1-1-.448-1-1 .448-1 1-1z" />
		                        </svg>
							</div>
							
							<h3 class="services-title">Production</h3>
							<div class="services-descr">Verge maximus ligula semper
								metusere pellentesque mattis. Integer non dapibus diam, eleifend.
								Praesent sed nisi eleifend, fermentum orci sit lorem amet.</div>
							<div class="services-more">
								<a href="#" class="text-link">Learn More</a>
							</div>
						</div>
					</div>
					<!-- End Services Item -->
				</div>
				<!-- End Services Grid -->
			</div>
		</section>
		<!-- End Services Section -->
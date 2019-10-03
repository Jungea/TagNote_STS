<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<title></title>
</head>
<body>
	<nav id="mainNav">

		<div class="navDiv1">
			<button class="ui teal button" onclick="location.href='memo'">새
				메모 쓰기</button>
		</div>

		<div class="navDiv2">
			<div class="ui list">
				<a class="item" href="star">
					<div class="fixed ui star rating" data-rating="1"
						data-max-rating="1" style="float: left; margin-right: 9px;"></div>
					<div class="content">
						<b>중요한 메모</b>
					</div>
				</a> <a class="item" href="recent"> <i
					class="icon sticky note outline" style="padding-left: 3px;"></i>
					<div class="content">
						<b>최근본 메모</b>
					</div>
				</a>
			</div>
		</div>

		<div class="navDiv3">
			<div id="target" class="ui styled accordion">
				<div class="title" style="border: 1px solid lightgray;">
					<i class="dropdown icon"></i> 태그 조합 즐겨찾기 <span
						class="navDiv3-setting-span" style="float: right"> <a>
							<i class="icon tagBookmark setting"></i>
					</a>
					</span>
				</div>
				<div class="content">

					<!--  -->
					<div class="ui list">

						<div class="item">

							<div class="content">
								<div class="header">태그조합</div>
								<div class="description"></div>


								<div class="list">
									<div class="item">

										<i class="bookmark yellow icon"></i>
										<div class="content">
											<div class="header link" path="bookmark-list.html?1">#2018년</div>
											<div class="description"></div>


											<div class="list">
												<div class="item">

													<i class="bookmark yellow icon"></i>
													<div class="content">
														<div class="header link" path="bookmark-list.html?1">#1학기</div>
														<div class="description"></div>

														<div class="list">
															<div class="item">

																<i class="bookmark yellow icon"></i>
																<div class="content">
																	<div class="header link" path="bookmark-list.html?1">#데이터베이스</div>
																	<div class="description"></div>
																</div>
															</div>
															<div class="item">
																<i class="bookmark yellow icon"></i>
																<div class="content">
																	<div class="header link" path="bookmark-list.html?1">#자바</div>
																	<div class="description"></div>
																</div>
															</div>
														</div>

													</div>

												</div>
												<div class="item">

													<i class="bookmark yellow icon"></i>
													<div class="content">
														<div class="header link" path="bookmark-list.html?1">#2학기</div>
														<div class="description"></div>
													</div>

												</div>

											</div>
										</div>
									</div>
									<div class="item">
										<i class="bookmark yellow icon"></i>
										<div class="content">
											<div class="header link" path="bookmark-list.html?1">#2019년</div>
											<div class="description"></div>
											<div class="list">
												<div class="item">

													<i class="bookmark yellow icon"></i>
													<div class="content">
														<div class="header link" path="bookmark-list.html?1">#1학기</div>
														<div class="description"></div>

													</div>

												</div>
												<div class="item">

													<i class="bookmark yellow icon"></i>
													<div class="content">
														<div class="header link" path="bookmark-list.html?1">#2학기</div>
														<div class="description"></div>
													</div>

												</div>

											</div>
										</div>
									</div>
									<div class="item">
										<i class="bookmark yellow icon"></i>
										<div class="content">
											<div class="header link" path="bookmark-list.html?1">#프로젝트</div>
											<div class="description"></div>

											<div class="list">
												<div class="item">

													<i class="bookmark yellow icon"></i>
													<div class="content">
														<div class="header link" path="bookmark-list.html?1">#HalliGalli</div>
														<div class="description"></div>
													</div>

												</div>

												<div class="item">

													<i class="bookmark yellow icon"></i>
													<div class="content">
														<div class="header link" path="bookmark-list.html?1">#TagNote</div>
														<div class="description"></div>
													</div>

												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
					<!--  -->

				</div>

				<div class="title" style="border: 1px solid lightgray;">
					<i class="dropdown icon"></i> 태그별 메모
				</div>
				<div class="content" style="padding-left: 30px;">

					<!--  -->
					<div class="ui list">

						<div class="item">

							<div class="header">태그목록</div>


							<div class="list">
								<div class="item">

									<div class="header link" path="tag-list.html?2">#2018년</div>

								</div>

								<div class="item">
									<div class="header link" path="tag-list.html?2">#2019년</div>

								</div>

								<div class="item">
									<div class="header link" path="tag-list.html?2">#프로젝트</div>

								</div>

								<div class="item">
									<div class="header link" path="tag-list.html?2">#1학기</div>

								</div>

								<div class="item">
									<div class="header link" path="tag-list.html?2">#2학기</div>

								</div>

								<div class="item">
									<div class="header link" path="tag-list.html?2">#TagNote</div>

								</div>

								<div class="item">
									<div class="header link" path="tag-list.html?2">#알고리즘</div>

								</div>
							</div>
						</div>

					</div>
					<!--  -->

				</div>
			</div>
		</div>

		<div class="navDiv4" style="padding-right: 15px;">

			<a href="trashCan"> <i class="icon trash alternate"
				style="margin-right: 10px"></i><b>휴지통</b>
			</a> <span class="test" style="float: right"
				onclick="confirm('휴지통을 비우시겠습니까?')"> <i
				class="icon trash alternate outline small"></i>
			</span>
		</div>

	</nav>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="API TEST2"></c:set>


<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Geolocation API 사용 예시</title>
</head>
<body>
  <h1>Geolocation API로 현재 위치 가져오기</h1>
  <button onclick="getLocation()">위치 찾기</button>
  <p id="status">위치를 찾지 못했습니다</p>

  <script>
    function getLocation() {
      const status = document.getElementById("status");

      // Geolocation API 지원 여부 확인
      if ("geolocation" in navigator) {
        navigator.geolocation.getCurrentPosition(
          (position) => {
            const { latitude, longitude, accuracy } = position.coords;
            status.textContent = `위도: ` + latitude + `, 경도: ` + longitude + `, 정확도: ` + accuracy + `미터`;
          },
          (error) => {
            // 위치 정보를 가져오지 못했을 때 "위치찾기 실패" 메시지 표시
            status.textContent = '위치찾기 실패: ' + error.message;
          },
          {
            enableHighAccuracy: true, // 정확도 우선 모드
            timeout: 10000,           // 10초 이내 응답 없으면 에러 발생
            maximumAge: 0             // 항상 최신 위치 정보 수집
          }
        );
      } else {
        status.textContent = "브라우저가 위치 서비스를 지원하지 않습니다.";
      }
    }
  </script>
</body>
</html>
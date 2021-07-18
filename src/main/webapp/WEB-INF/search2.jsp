<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 장소 표시하기</title>

</head>
<body>
<p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
        </a>
    </em>
</p>
<div id="mapWrap" data-x="" data-y="">
    <div id="map" style="width:100%;height:350px;"></div>
    <form onsubmit="searchAddress(); return false" >
        <input id="searchWord" type="text" placeholder="검색어를 입력하시오">
        <input type="submit" value="검색하기">
    </form>
</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=082cfeea117f1864eeae6afb01ef3f74&libraries=services"></script>
<script>
    var mapWrap=document.querySelector('#mapWrap')
    var searchWord=document.querySelector('#searchWord')
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };
    // 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);
    //마커 생성
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(33.450701, 126.570667),
        draggable: true
    });
    //인포 생성
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">현재위치</div>'
    })
    infowindow.open(map, marker);
    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    function addFun(){
        kakao.maps.event.addListener(marker, 'dragstart', function() {
            infowindow.close()
        })
        kakao.maps.event.addListener(marker, 'dragend', function(mouseEvent) {
            console.log(marker.getPosition())
            console.log(marker.getPosition().La)
            console.log(marker.getPosition().Ma)
            mapWrap.dataset.x=marker.getPosition().La
            mapWrap.dataset.y=marker.getPosition().Ma
            infowindow.open(map, marker);
        });
    }

    function searchAddress(){
        // 주소로 좌표를 검색합니다
        geocoder.addressSearch(searchWord.value, function(result, status) {
            console.log(searchWord.value)
            // 정상적으로 검색이 완료됐으면
            if (status === kakao.maps.services.Status.OK) {
                console.log('성공')
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                // 결과값으로 받은 위치를 마커로 표시합니다
                marker.setPosition(coords)
                // 인포윈도우로 장소에 대한 설명을 표시합니다
                infowindow.open(map, marker);
                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
                //마커 위치저장
                mapWrap.dataset.x=marker.getPosition().La
                mapWrap.dataset.y=marker.getPosition().Ma
            }
        });
    }

    addFun()
</script>
</body>
</html>
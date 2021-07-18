<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>draggable 마커 이벤트 적용하기</title>

</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>
<p><em>마커를 드래그 해주세요!</em></p>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=082cfeea117f1864eeae6afb01ef3f74"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667),
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    var startSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발 마커이미지의 주소입니다
        startSize = new kakao.maps.Size(50, 45), // 출발 마커이미지의 크기입니다
        startOption = {
            offset: new kakao.maps.Point(15, 43) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
        };

    // 출발 마커 이미지를 생성합니다
    var startImage = new kakao.maps.MarkerImage(startSrc, startSize, startOption);

    var startDragSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_drag.png', // 출발 마커의 드래그 이미지 주소입니다
        startDragSize = new kakao.maps.Size(50, 64), // 출발 마커의 드래그 이미지 크기입니다
        startDragOption = {
            offset: new kakao.maps.Point(15, 54) // 출발 마커의 드래그 이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
        };

    // 출발 마커의 드래그 이미지를 생성합니다
    var startDragImage = new kakao.maps.MarkerImage(startDragSrc, startDragSize, startDragOption);

    // 출발 마커가 표시될 위치입니다
    var startPosition = new kakao.maps.LatLng(33.450701, 126.570667);

    // 출발 마커를 생성합니다
    var startMarker = new kakao.maps.Marker({
        map: map, // 출발 마커가 지도 위에 표시되도록 설정합니다
        position: startPosition,
        draggable: true, // 출발 마커가 드래그 가능하도록 설정합니다
        image: startImage // 출발 마커이미지를 설정합니다
    });

    // 출발 마커에 dragstart 이벤트를 등록합니다
    kakao.maps.event.addListener(startMarker, 'dragstart', function() {
        // 출발 마커의 드래그가 시작될 때 마커 이미지를 변경합니다
        startMarker.setImage(startDragImage);
    });

    // 출발 마커에 dragend 이벤트를 등록합니다
    kakao.maps.event.addListener(startMarker, 'dragend', function() {
        // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
        startMarker.setImage(startImage);
    });
//--------------------------------------------------------------------------------------------
    var arriveSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png', // 도착 마커이미지 주소입니다
        arriveSize = new kakao.maps.Size(50, 45), // 도착 마커이미지의 크기입니다
        arriveOption = {
            offset: new kakao.maps.Point(15, 43) // 도착 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
        };

    // 도착 마커 이미지를 생성합니다
    var arriveImage = new kakao.maps.MarkerImage(arriveSrc, arriveSize, arriveOption);

    var arriveDragSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_drag.png', // 도착 마커의 드래그 이미지 주소입니다
        arriveDragSize = new kakao.maps.Size(50, 64), // 도착 마커의 드래그 이미지 크기입니다
        arriveDragOption = {
            offset: new kakao.maps.Point(15, 54) // 도착 마커의 드래그 이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
        };

    // 도착 마커의 드래그 이미지를 생성합니다
    var arriveDragImage = new kakao.maps.MarkerImage(arriveDragSrc, arriveDragSize, arriveDragOption);

    // 도착 마커가 표시될 위치입니다
    var arrivePosition = new kakao.maps.LatLng(33.450701, 126.572667);

    // 도착 마커를 생성합니다
    var arriveMarker = new kakao.maps.Marker({
        map: map, // 도착 마커가 지도 위에 표시되도록 설정합니다
        position: arrivePosition,
        draggable: true, // 도착 마커가 드래그 가능하도록 설정합니다
        image: arriveImage // 도착 마커이미지를 설정합니다
    });

    // 도착 마커에 dragstart 이벤트를 등록합니다
    kakao.maps.event.addListener(arriveMarker, 'dragstart', function() {
        // 도착 마커의 드래그가 시작될 때 마커 이미지를 변경합니다
        arriveMarker.setImage(arriveDragImage);
    });

    // 도착 마커에 dragend 이벤트를 등록합니다
    kakao.maps.event.addListener(arriveMarker, 'dragend', function() {
        // 도착 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
        arriveMarker.setImage(arriveImage);
    });
</script>
</body>
</html>
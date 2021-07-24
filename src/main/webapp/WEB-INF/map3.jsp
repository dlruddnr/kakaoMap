<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>마커 생성하기</title>

</head>
<body>

<div>
    <form name="selectRegion" onsubmit="return addPin()">
        <input id="regionValue" name="region" type="text" placeholder="지역을 적으시오">
        <input type="submit" value="입력">
    </form>
</div>

<div id="map" style="width:100%;height:350px;"></div>
<%--<p>--%>
<%--    <button onclick="hideMarkers()">마커 감추기</button>--%>
<%--    <button onclick="showMarkers()">마커 보이기</button>--%>
<%--</p>--%>
<em>클릭한 위치에 마커가 표시됩니다!</em>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=082cfeea117f1864eeae6afb01ef3f74"></script>
<script>
    var iwContent = '<div style="padding:5px;">Hello World!</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 지도에 표시된 마커 객체를 가지고 있을 배열입니다
    var markers = [];


    // 마커를 생성하고 지도위에 표시하는 함수입니다
    function addMarker(position) {
        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            position: position
        });

        // 마커가 지도 위에 표시되도록 설정합니다
        markerAddEventOver(marker)
        marker.setMap(map);
        // 생성된 마커를 배열에 추가합니다
        markers.push(marker);
    }

    // // 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
    // function setMarkers(map) {
    //     for (var i = 0; i < markers.length; i++) {
    //         markers[i].setMap(map);
    //     }
    // }

    // // "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
    // function showMarkers() {
    //     setMarkers(map)
    // }
    //
    // // "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
    // function hideMarkers() {
    //     setMarkers(null);
    // }
    // function markerAddEventOut(){
    //     kakao.maps.event.addListener(marker, 'mouseout', function() {
    //         var infowindow = new kakao.maps.InfoWindow({
    //             content : iwContent
    //         });
    //         infowindow.open(map,marker)
    //     });
    // }
    function markerAddEventOver(marker){

        var iwContent = '<div style="padding:5px;">Hello World!</div>';
        var infowindow = new kakao.maps.InfoWindow({
            content : iwContent
        });
        kakao.maps.event.addListener(marker, 'mouseover', function() {
            infowindow.open(map,marker)
        });
        kakao.maps.event.addListener(marker, 'mouseout', function() {
            infowindow.close()
        });
    }

    //----------------------------------------------------------------

    function addPin(){
        removePin(markers)
        var selRegionElem=document.querySelector('#regionValue')
        fetch('map3/'+selRegionElem.value)
        .then(res => res.json())
        .then(myJson =>{
            myJson.forEach(function(currentValue){
                var latlng = new kakao.maps.LatLng(currentValue.location_Y, currentValue.location_X);
                addMarker(latlng)
            })
        })
        return false
    }

    function removePin(markers){
        markers.forEach(function(currentValue){
            currentValue.setMap(null)
        })
        this.markers=[]
    }
</script>
</body>
</html>
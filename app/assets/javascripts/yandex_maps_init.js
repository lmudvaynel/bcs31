ymaps.ready(init);
ymaps.ready(init2);

function init() {
    var myMap = new ymaps.Map("map1", {
        center: [50.6334, 36.5761],
        zoom: 16
    });

    // Создаем многоугольник, используя класс GeoObject.
    var myGeoObject = new ymaps.GeoObject({
        // Описываем геометрию геообъекта.
        geometry: {
            // Тип геометрии - "Многоугольник".
            type: "Polygon",
            // Указываем координаты вершин многоугольника.
            coordinates: [
                // Координаты вершин внешнего контура.
                [
                    [ 50.6335, 36.5760 ],
                    [ 50.6335, 36.5762 ],
                    [ 50.6334, 36.5762 ],
                    [ 50.6334, 36.5760 ],
                    [ 50.6335, 36.5760 ]
                ],
                // Координаты вершин внутреннего контура.
                [

                ]
            ],
            // Задаем правило заливки внутренних контуров по алгоритму "nonZero".
            fillRule: "nonZero"
        },
        // Описываем свойства геообъекта.
        properties:{
            // Содержимое балуна.
            balloonContent: "308023, г.Белгород, ул.Железнякова, д.14Б"
        }
    }, {
        // Описываем опции геообъекта.
        // Цвет заливки.
        fillColor: '#F7961F',
        // Цвет обводки.
        strokeColor: '#000000',
        // Общая прозрачность (как для заливки, так и для обводки).
        opacity: 1,
        // Ширина обводки.
        strokeWidth: 1,
        // Стиль обводки.
        strokeStyle: 'solid'
    });

    // Добавляем многоугольник на карту.
    myMap.geoObjects.add(myGeoObject);



// Создание метки
    var myPlacemark = new ymaps.Placemark(
        // Координаты метки
        [50.6334900, 36.576210], {
            style: 'twirl#blueDotIcon',
            balloonContent: '308023, г.Белгород, ул.Железнякова, д.14Б'
        }
    );
    // Открываем балун на карте (без привязки к геообъекту).
    myMap.balloon.open([50.6334900, 36.576210], '308023, г.Белгород, ул.Железнякова, д.14Б', {
        // Опция: не показываем кнопку закрытия.
        closeButton: true
    });
    MyMaps.Events.observe(map,map.Events.Click, function () {
        alert("Щелк!");
    });


    // Добавление метки на карту
    myMap.geoObjects.add(myPlacemark);


    // элемента управления и его параметры.
    myMap.controls
        // Кнопка изменения масштаба.
        .add('zoomControl', { left: 5, top: 5 })
        // Список типов карты
        .add('typeSelector')
        // Стандартный набор кнопок
        .add('mapTools', { left: 35, top: 5 });

    // Также в метод add можно передать экземпляр класса элемента управления.
    // Например, панель управления пробками.
    var trafficControl = new ymaps.control.TrafficControl();
    myMap.controls
//        .add(trafficControl)
        // В конструкторе элемента управления можно задавать расширенные
        // параметры, например, тип карты в обзорной карте.
        .add(new ymaps.control.MiniMap({
            type: 'yandex#publicMap'
        }));

}
    function init2() {
    var myMap = new ymaps.Map("map2", {
        center: [51.307, 37.868885],
        zoom: 16
    });

    // Создаем многоугольник, используя класс GeoObject.
    var myGeoObject = new ymaps.GeoObject({
        // Описываем геометрию геообъекта.
        geometry: {
            // Тип геометрии - "Многоугольник".
            type: "Polygon",
            // Указываем координаты вершин многоугольника.
            coordinates: [
                // Координаты вершин внешнего контура.
                [
                    [55.75, 37.80],
                    [55.80, 37.90],
                    [55.75, 38.00],
                    [55.70, 38.00],
                    [55.70, 37.80]
                ],
                // Координаты вершин внутреннего контура.
                [
                    [55.75, 37.82],
                    [55.75, 37.98],
                    [55.65, 37.90]
                ]
            ],
            // Задаем правило заливки внутренних контуров по алгоритму "nonZero".
            fillRule: "nonZero"
        },
        // Описываем свойства геообъекта.
        properties:{
            // Содержимое балуна.
            balloonContent: "Старый Оскол, ул Прядченко, д.118 оф 34"
        }
    }, {
        // Описываем опции геообъекта.
        // Цвет заливки.
        fillColor: '#F7961F',
        // Цвет обводки.
        strokeColor: '#F7961F',
        // Общая прозрачность (как для заливки, так и для обводки).
        opacity: 0.5,
        // Ширина обводки.
        strokeWidth: 5,
        // Стиль обводки.
        strokeStyle: 'shortdash'
    });
        // Открываем балун на карте (без привязки к геообъекту).
        myMap.balloon.open([51.307, 37.868885], 'Старый Оскол, ул Прядченко, д.118 оф 34', {
            // Опция: не показываем кнопку закрытия.
            closeButton: true
        });

    // Добавляем многоугольник на карту.
    myMap.geoObjects.add(myGeoObject);
        // Создание метки
        var myPlacemark = new ymaps.Placemark(
            // Координаты метки
            [51.307, 37.868885], {
                style: 'twirl#blueDotIcon',
                balloonContent: 'Старый Оскол, ул Прядченко, д.118 оф 34'
            }
        );

        // Добавление метки на карту
        myMap.geoObjects.add(myPlacemark);


        // элемента управления и его параметры.
        myMap.controls
            // Кнопка изменения масштаба.
            .add('zoomControl', { left: 5, top: 5 })
            // Список типов карты
            .add('typeSelector')
            // Стандартный набор кнопок
            .add('mapTools', { left: 35, top: 5 });

        // Также в метод add можно передать экземпляр класса элемента управления.
        // Например, панель управления пробками.
        var trafficControl = new ymaps.control.TrafficControl();
        myMap.controls
//        .add(trafficControl)
            // В конструкторе элемента управления можно задавать расширенные
            // параметры, например, тип карты в обзорной карте.
            .add(new ymaps.control.MiniMap({
                type: 'yandex#publicMap'
            }));

}

ymaps.ready(init);
ymaps.ready(init2);

function init () {
    var myMap = new ymaps.Map('map1', {
        center: [50.633046, 36.576155],
        zoom: 13
    });

    // Создание метки
    var myPlacemark = new ymaps.Placemark(
        // Координаты метки
        [50.633046, 36.576155], {
            style: 'twirl#orangeIcon',
            balloonContent: '308023, г.Белгород, ул.Железнякова, д.14Б'
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

    /*
     // Удаление элементов управления производится через метод remove.
     myMap.controls
     .remove(trafficControl)
     .remove('mapTools');
     */

}

function init2 () {
    var myMap2 = new ymaps.Map('map2', {
        center: [51.307, 37.868885],
        zoom: 15
    });
    // Создание метки
    var myPlacemark2 = new ymaps.Placemark(
        // Координаты метки
        [51.307, 37.868885], {
            balloonContent: 'Старый Оскол, ул Прядченко, д.118 оф 34'
        }
    );

    // Добавление метки на карту
    myMap2.geoObjects.add(myPlacemark2);


    // Для добавления элемента управления на карту
    // используется поле map.controls.
    // Это поле содержит ссылку на экземпляр класса map.control.Manager.

    // Добавление элемента в коллекцию производится
    // с помощью метода add.

    // В метод add можно передать строковый идентификатор
    // элемента управления и его параметры.
    myMap2.controls
        // Кнопка изменения масштаба.
        .add('zoomControl', { left: 5, top: 5 })
        // Список типов карты
        .add('typeSelector')
        // Стандартный набор кнопок
        .add('mapTools', { left: 35, top: 5 });

    // Также в метод add можно передать экземпляр класса элемента управления.
    // Например, панель управления пробками.
    var trafficControl = new ymaps.control.TrafficControl();
    myMap2.controls
//        .add(trafficControl)
        // В конструкторе элемента управления можно задавать расширенные
        // параметры, например, тип карты в обзорной карте.
        .add(new ymaps.control.MiniMap({
            type: 'yandex#publicMap'
        }));

    /*
     // Удаление элементов управления производится через метод remove.
     myMap.controls
     .remove(trafficControl)
     .remove('mapTools');
     */
}


var goodsCar = [];
var isOpen = false;
var interval;

function updateGoodsCar(goods) {
    for (var g of goodsCar) {
        if (g.id === goods.id) {
            g.num = goods.num;
            return;
        }
    }
    goodsCar.push(goods);
}

function changeNum(type) {
    var id = type.parentNode.parentNode.id;
    var typeid = type.parentNode.parentNode.parentNode.id;
    var name = type.parentNode.parentNode.childNodes[0].innerText;
    var price = type.parentNode.parentNode.childNodes[1].innerText;
    var num = 0;
    var nums = type.parentNode.parentNode.childNodes[3];
    switch (type.innerText) {
        case '-':
            if (parseInt(nums.innerText) === 0) {
                num = 0;
                break;
            } else {
                num = -1;
            }
            break;
        case '+':
            num = 1;
            break;
    }
    nums.innerText = parseInt(nums.innerText) + num;
    var goods = {
        "id": id,
        "food":
            {
                "id": id,
                "name": name,
                "price": price,
                "foodtype":
                    {
                        "id": typeid,
                        "name": name,
                        "isdelete": 1
                    },
                "isdelete": 1
            },
        "num": nums.innerText
    };
    updateGoodsCar(goods);
}

function drawTable(data) {
    var right = document.querySelector(".right");
    var table = document.createElement("table");
    var oldtable = document.querySelector("table")
    if (oldtable !== null) {
        oldtable.remove();
    }
    right.appendChild(table);
    for (var json of data) {
        table.id = json.foodType.id;
        var tr = document.createElement("tr");
        tr.id = json.id;
        var td = document.createElement("td");
        td.innerHTML = json.name;
        tr.appendChild(td);

        td = document.createElement("td");
        td.innerHTML = json.price;
        tr.appendChild(td);

        td = document.createElement("td");
        var btn = document.createElement("div");
        btn.innerHTML = "-";
        td.appendChild(btn);
        tr.appendChild(td);
        btn.addEventListener('click', function () {
            changeNum(this);
        });


        td = document.createElement("td");
        td.innerHTML = 0;
        for (var g of goodsCar) {
            if (g.id === tr.id) {
                td.innerHTML = g.num;
            }
        }
        tr.appendChild(td);
        td.id = json.id;

        td = document.createElement("td");
        var btn = document.createElement("div");
        btn.innerHTML = "+";
        td.appendChild(btn);
        tr.appendChild(td);
        btn.addEventListener('click', function () {
            changeNum(this)
        });

        table.appendChild(tr);
    }
}

function showFoods(id) {
    $.ajax({
        "url": "ShowFoods",
        "type": 'post',
        "data": {id: id},
        "dataType": "json"
    })
        .done(function (data) {
            drawTable(data);
        })
}

function updateGoodsCarList(Car) {
    var div = document.createElement("div")
    var table = document.createElement("table");
    var olddiv = document.querySelector("#carTable");
    if (olddiv !== null) {
        olddiv.remove();
    }
    Car.appendChild(div);
    div.appendChild(table)
    div.id = "carTable";
    for (var i = 1; i <= goodsCar.length; i++) {
        var tr = document.createElement("tr");
        var td = document.createElement("td");
        td.innerHTML = i;
        table.appendChild(tr);
        tr.appendChild(td);

        td = document.createElement("td");
        td.innerHTML = goodsCar[i - 1].food.name;
        tr.appendChild(td);

        td = document.createElement("td");
        td.innerHTML = goodsCar[i - 1].food.price;
        tr.appendChild(td);

        td = document.createElement("td");
        td.innerHTML = goodsCar[i - 1].num;
        tr.appendChild(td);
    }
    var button = document.createElement("button");
    div.appendChild(button);
    button.innerText = "结算";
    button.addEventListener("click", function () {
        total();
    })
}

function showGoodsCar(Car) {
    var name = Car.id;
    isOpen = !isOpen;
    if (isOpen) {
        name = "open";
        Car.childNodes[0].textContent = "";
        updateGoodsCarList(Car);

    } else {
        name = "car";
        Car.childNodes[0].textContent = "购物车";
        var olddiv = document.querySelector("#carTable");
        if (olddiv !== null) {
            clearInterval(interval);
            olddiv.remove();
        }
    }
    Car.id = name;
}

function total() {
    var str = "";
    var money = 0;
    for (var g of goodsCar) {
        str += g.food.name + " ";
        str += g.num + " ";
        str += "\n";
        money = g.num * g.food.price + money;
    }
    var goodsList = [];
    for (var goods of goodsCar) {
        var list = [goods.num, goods.id];
        goodsList.push(list);
    }
    if (confirm("您购买的物品如下:\n" + str + "总金额为" + money)) {
        //传值给ajax
        $.ajax({
            url: "/InsertCheckList",
            type: "post",
            data: {
                car: JSON.stringify(goodsList)
            }
        }).done(function (t) {
            // console.log(goodsList);
        }).fail(function (t) {
            // alert("fuckshit111");
            console.log('失败');
        });
    } else {

    }
}
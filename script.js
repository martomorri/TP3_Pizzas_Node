let lista_pizzas = null;

const getAllPizzas = (url) => {
    url;
    console.log(url);
    axios.get(url)
        .then(res => {
            const tablaPizzas = document.getElementById("tablaPizzas");
            lista_pizzas = res.data.Pizzas;
            res.data.Pizzas.forEach(element => {
                const fila = document.createElement("tr");
                fila.innerHTML = `<th>${element.Id}</th>
                                <td>${element.Nombre}</td>
                                <td>$${element.Importe}</td>`;
                tablaPizzas.appendChild(fila);
            });
        })
}

getAllPizzas("http://localhost:5000/api/pizzas/");

const input = document.getElementById("buscar");
input.onkeyup = (e) => {
    let lista_busqueda = [];
    const tablaPizzas = document.getElementById("tablaPizzas");
    if (e.target.value) {
        let i = 0;
        while (i < lista_pizzas.length) {
            for (let index = 0; index < e.target.value.length; index++) {
                console.log(lista_pizzas[i].Nombre[index].toLowerCase());
                if (e.target.value.toLowerCase() == lista_pizzas[i].Nombre[index].toLowerCase()) {
                    lista_busqueda.push(lista_pizzas[i]);
                }
            }
            i++;
        }
        console.log(lista_busqueda);
        lista_busqueda.forEach(element => {
            tablaPizzas.innerHTML = "";
            const fila = document.createElement("tr");
            fila.innerHTML = `<th>${element.Id}</th>
                            <td>${element.Nombre}</td>
                            <td>$${element.Importe}</td>`;
            tablaPizzas.appendChild(fila);
        });
    } else {
        tablaPizzas.innerHTML = "";
        getAllPizzas("http://localhost:5000/api/pizzas/");
    }

}

// const verMas = id => {
//     const titulo = document.getElementById("titulo");
//     const detalle = document.getElementById("pizza");
//     titulo.innerHTML = `${lista_pizzas[id-1].Nombre}`;
//     detalle.innerHTML = `<p>${lista_pizzas[id-1].Descripcion}</p>
//                         <hr style="border: 1px solid black; padding:0; opacity: 100;">
//                         <b>Precio:</b>U$D ${lista_pizzas[id-1].Importe}<br>`;
// }
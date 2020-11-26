function computation (){
  const price = document.getElementById("item-price");
  const priceCommision = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  price.addEventListener("keyup", () => {
    const calculationResult = Math.floor(price.value * 0.1);
    priceCommision.innerHTML = calculationResult;
    const salesProfit = price.value - calculationResult;
    profit.innerHTML = salesProfit;
  });
}

window.addEventListener('load', computation);
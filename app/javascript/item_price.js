function input_price() {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue / 100 * 10 );
    const profit = document.getElementById("profit")
    profit.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);

  })

}

window.addEventListener('load', input_price);
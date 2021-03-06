window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput){return false;}
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDomValue = (Math.floor(inputValue * 0.1));
    addTaxDom.innerHTML = addTaxDomValue;

    const salesPrice = document.getElementById("profit");
    salesPrice.innerHTML = (Math.floor(inputValue - addTaxDomValue));
   });
  });
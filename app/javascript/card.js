const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const submit = document.getElementById("button_reservation");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("reservation-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("reservation_form[number]"),
      cvc: formData.get("reservation_form[cvc]"),
      exp_month: formData.get("reservation_form[exp_month]"),
      exp_year: `20${formData.get("reservation_form[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("reservation-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("reservation_form_number").removeAttribute("name");
      document.getElementById("reservation_form_cvc").removeAttribute("name");
      document.getElementById("reservation_form_exp_month").removeAttribute("name");
      document.getElementById("reservation_form_exp_year").removeAttribute("name");

      document.getElementById("reservation-form").submit();
    });
  });
};

window.addEventListener("load", pay);
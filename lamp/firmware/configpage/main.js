const scanButton = document.getElementById("scan_button");
const ssidInput = document.getElementById("ssid_input");
const ssidSelect = document.getElementById("ssid_select");

window.onload = function () {
  ssidSelect.onchange = function (e) {
    ssidInput.value = e.target.value;
  };
  scan();
};

async function scan(event) {
  if (event) {
    event.preventDefault();
  }

  scanButton.disabled = true;
  scanButton.innerHTML = "Scanning...";

  const response = await fetch("/api/wifi/networks");
  const data = await response.json();

  if (data.length > 0) {
    ssidSelect.innerHTML = "";
    const headerOption = document.createElement("option");
    headerOption.value = "";
    headerOption.text = "Please select an SSID";
    ssidSelect.appendChild(headerOption);
    data.forEach((ssid) => {
      const option = document.createElement("option");
      option.value = ssid;
      option.text = ssid;
      ssidSelect.appendChild(option);
    });
  } else {
    alert("No SSIDs found");
  }

  ssidSelect.classList.remove("hidden");
  scanButton.innerHTML = "Scan for SSIDs";
  scanButton.disabled = false;
}

window.scan = scan;

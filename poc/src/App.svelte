<script>
  import toastr from "toastr";
  import Select from "svelte-select";

  let isSidebarCollapsed = false;

  function toggleSidebar() {
    isSidebarCollapsed = !isSidebarCollapsed;
  }

  let isLoading = false;
  let stopRequest = false;

  function handleAnimationIteration() {
    if (stopRequest) {
      stopRequest = false;
      isLoading = false;
    }
  }

  function toggleLoading() {
    if (!isLoading) {
      isLoading = true;
    } else {
      stopRequest = true;
    }
  }

  toastr.options = {
    closeButton: true,
    progressBar: true,
    positionClass: "toast-bottom-right",
    timeOut: "3000",
  };

  function showToast() {
    toastr.success("Connection established.");
  }

  let options = [
    { label: "Option1", value: 1 },
    { label: "Option2", value: 2 },
    { label: "Option3", value: 3 },
  ];
  let selectedOption = options[0];
</script>

<div class="layout-wrapper">
  <div class="header">
    <div class="pure-g">
      <div class="pure-u-1-2">
        <div class="header-left">
          <button class="hamburger-btn" on:click={toggleSidebar}>
            <i class="fas fa-bars"></i>
          </button>
          <a href="#" class="pure-menu-heading">
            <img
              class="pure-image"
              src="/logo-ge-ce-pe-1559b7af.svg"
              alt="gcp"
            />
            <span>Dokumenty</span>
          </a>
        </div>
      </div>
      <div class="pure-u-1-2">
        <div class="header-right">
          <a href="#" class="pure-menu-link">email@email.com</a>
        </div>
      </div>
    </div>
  </div>

  <div class="content-wrapper">
    <div class="pure-g">
      <div
        class="sidebar {isSidebarCollapsed
          ? 'pure-u-1-24 collapsed'
          : 'pure-u-1-8'}"
        id="sidebar"
      >
        <div class="pure-menu pure-menu-vertical">
          <ul class="pure-menu-list">
            <li class="pure-menu-item">
              <a href="#" class="pure-menu-link">
                <i class="fas fa-dashboard"></i><span>Nástěnka</span>
              </a>
            </li>
            <li class="pure-menu-item">
              <a href="#" class="pure-menu-link">
                <i class="fas fa-file"></i><span>Dokumenty</span>
              </a>
            </li>
            <li class="pure-menu-item">
              <a href="#" class="pure-menu-link">
                <i class="fas fa-layer-group"></i><span>Zařazení</span>
              </a>
            </li>
            <li class="pure-menu-item">
              <a href="#" class="pure-menu-link">
                <i class="fas fa-list"></i><span>Umístění</span>
              </a>
            </li>
            <li class="pure-menu-item">
              <a href="#" class="pure-menu-link">
                <i class="fas fa-users-viewfinder"></i><span>Objekty</span>
              </a>
            </li>
            <li class="pure-menu-item pure-menu-has-children">
              <a href="#" id="menuLink1" class="pure-menu-link">
                <i class="fas fa-cogs"></i><span>Administrace</span>
              </a>
              <ul class="pure-menu-children">
                <li class="pure-menu-item">
                  <a href="#" class="pure-menu-link">Autos</a>
                </li>
                <li class="pure-menu-item">
                  <a href="#" class="pure-menu-link">Flickr</a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div>

      <div
        class="main {isSidebarCollapsed ? 'pure-u-23-24' : 'pure-u-7-8'}"
        id="main"
      >
        <div class="main-content">
          <div
            class="loader-line {isLoading ? 'active infinite' : ''}"
            id="loaderLine"
            on:animationiteration={handleAnimationIteration}
          ></div>
          <div class="pure-g card">
            <div class="pure-u-1-2 pure-form">
              <input type="text" placeholder="Vyberte čas" />
            </div>
            <div class="pure-u-1-2" style="text-align: right;">
              <button class="pure-button pure-button-primary">Obnovit</button>
            </div>
          </div>

          <div class="pure-g card">
            <div class="pure-u-1-3 pure-u-lg-1-4 pure-u-xl-1-8">
              <div class="box">Počet dokumentů</div>
            </div>
            <div class="pure-u-1-3 pure-u-lg-1-4 pure-u-xl-1-8">
              <div class="box">Počet obrazců</div>
            </div>
            <div class="pure-u-1-3 pure-u-lg-1-4 pure-u-xl-1-8">
              <div class="box">Počet velkolepych panu</div>
            </div>
          </div>

          <div class="pure-g card">
            <table>
              <caption>Statement Summary</caption>
              <thead>
                <tr>
                  <th scope="col">Account</th>
                  <th scope="col">Due Date</th>
                  <th scope="col">Amount</th>
                  <th scope="col">Period</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td data-label="Account">Visa - 3412</td>
                  <td data-label="Due Date">04/01/2016</td>
                  <td data-label="Amount">$1,190</td>
                  <td data-label="Period">03/01/2016 - 03/31/2016</td>
                </tr>
                <tr>
                  <td scope="row" data-label="Account">Visa - 6076</td>
                  <td data-label="Due Date">03/01/2016</td>
                  <td data-label="Amount">$2,443</td>
                  <td data-label="Period">02/01/2016 - 02/29/2016</td>
                </tr>
                <tr>
                  <td scope="row" data-label="Account">Corporate AMEX</td>
                  <td data-label="Due Date">03/01/2016</td>
                  <td data-label="Amount">$1,181</td>
                  <td data-label="Period">02/01/2016 - 02/29/2016</td>
                </tr>
                <tr>
                  <td scope="row" data-label="Acount">Visa - 3412</td>
                  <td data-label="Due Date">02/01/2016</td>
                  <td data-label="Amount">$842</td>
                  <td data-label="Period">01/01/2016 - 01/31/2016</td>
                </tr>
              </tbody>
            </table>
          </div>

          <div class="pure-g card">
            <div class="pure-u-1-2">
              <table class="pure-table pure-table-horizontal">
                <thead>
                  <tr>
                    <th>Katalog</th>
                    <th>Kód</th>
                    <th>Název</th>
                    <th>Počet stažení</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>Správa ŽP</td>
                    <td>AAAAA</td>
                    <td>Připomínky a návrhy na změnu rozcestníku</td>
                    <td>4</td>
                  </tr>
                  <tr>
                    <td>Správa ŽP</td>
                    <td>AAAAA</td>
                    <td>Připomínky a návrhy na změnu rozcestníku</td>
                    <td>4</td>
                  </tr>
                  <tr>
                    <td>Správa ŽP</td>
                    <td>AAAAA</td>
                    <td>Připomínky a návrhy na změnu rozcestníku</td>
                    <td>4</td>
                  </tr>
                  <tr>
                    <td>Správa ŽP</td>
                    <td>AAAAA</td>
                    <td>Připomínky a návrhy na změnu rozcestníku</td>
                    <td>4</td>
                  </tr>
                  <tr>
                    <td>Správa ŽP</td>
                    <td>AAAAA</td>
                    <td>Připomínky a návrhy na změnu rozcestníku</td>
                    <td>4</td>
                  </tr>
                  <tr>
                    <td>Správa ŽP</td>
                    <td>AAAAA</td>
                    <td>Připomínky a návrhy na změnu rozcestníku</td>
                    <td>4</td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="pure-u-1-2">
              <table class="pure-table pure-table-horizontal">
                <thead>
                  <tr>
                    <th>Katalog</th>
                    <th>Kód</th>
                    <th>Název</th>
                    <th>Počet stažení</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>Správa ŽP</td>
                    <td>AAAAA</td>
                    <td>Připomínky a návrhy na změnu rozcestníku</td>
                    <td>4</td>
                  </tr>
                  <tr>
                    <td>Správa ŽP</td>
                    <td>AAAAA</td>
                    <td>Připomínky a návrhy na změnu rozcestníku</td>
                    <td>4</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div class="pure-g card">
            <div class="pure-u-1 card-header">
              Button experiments
            </div>
            <div class="pure-form centered-container">
              <div class="input-icon-wrapper">
                <div class="input-icon-container">
                  <i class="input-icon fas fa-envelope"></i>
                </div>
                <input
                  type="email"
                  class="pure-input input-with-icon"
                  placeholder="Email"
                />
              </div>
            </div>
            <div class="centered-container">
              <button class="pure-button pure-button-primary ripple"
                >Ripple</button
              >
            </div>
            <div class="centered-container">
              <button
                class="pure-button pure-button-primary loading-button"
                id="loadingButton"
                on:click={toggleLoading}>Loading</button
              >
            </div>
            <div class="centered-container">
              <button
                class="pure-button pure-button-primary"
                id="show-toast"
                on:click={showToast}>Toastr</button
              >
            </div>

            <div class="icheck-primary centered-container">
              <input type="checkbox" id="someCheckboxId" />
              <label for="someCheckboxId">i-check</label>
            </div>

            <div>
              <Select
                bind:value={selectedOption}
                items={options}
                placeholder="Select"
                class="svelte-select"
              ></Select>
            </div>
          </div>
        </div>

        <div class="pure-g">
          <div
            class="footer {isSidebarCollapsed ? 'pure-u-23-24' : 'pure-u-7-8'}"
            id="footer"
          >
            <div class="footer-content">Všechna práva vyhrazena.</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

var req;
var isIE;
var completeField;
var completeTable;
var autoRow;

function init() {
	alert("In javascript");
	completeField = document.getElementById("searchId");
    completeTable = document.getElementById("complete-table");
    autoRow = document.getElementById("auto-row");
    completeTable.style.top = getElementY(autoRow) + "px";
    
    console.log("In init()");
}

function doCompletion() {
    var url = "AutocompleteServlet?action=complete&searchId=" + escape(completeField.value);
    console.log("In docomppletion()"+escape(completeField.value));
    req = initRequest();
    req.open("GET", url, true);
    console.log("after open()");
    req.onreadystatechange = callback;
    req.send(null);
}

function initRequest() {
    if (window.XMLHttpRequest) {
        if (navigator.userAgent.indexOf('MSIE') != -1) {
            isIE = true;
        }
        return new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        isIE = true;
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
}

function callback() {
    clearTable();
    console.log("In callback"+req.responseXML);
    if (req.readyState == 4) {
    if (req.status == 200) {
        parseMessages(req.responseXML);
    }
    }
}


function appendProduct(productName,productId) {
    var row;
    var cell;
    var linkElement;
    if (isIE) {
        completeTable.style.display = 'block';
        row = completeTable.insertRow(completeTable.rows.length);
        cell = row.insertCell(0);
    } else {
        completeTable.style.display = 'table';
        row = document.createElement("tr");
        cell = document.createElement("td");
        row.appendChild(cell);
        completeTable.appendChild(row);
    }
    cell.className = "popupCell";
    linkElement = document.createElement("a");
    linkElement.className = "popupItem";
    linkElement.setAttribute("href", "showBooksServlet?action=lookup&searchName=" + productName);
    linkElement.appendChild(document.createTextNode(productName));
    cell.appendChild(linkElement);
}

function clearTable() {
    if (completeTable.getElementsByTagName("tr").length > 0) {
        completeTable.style.display = 'none';
        for (loop = completeTable.childNodes.length -1; loop >= 0 ; loop--) {
            completeTable.removeChild(completeTable.childNodes[loop]);
        }
    }   
}

function getElementY(element){
    
    var targetTop = 0;
    
    if (element.offsetParent) {
        while (element.offsetParent) {
            targetTop += element.offsetTop;
            element = element.offsetParent;
        }
    } else if (element.y) {
        targetTop += element.y;
    }
    return targetTop;
}

function parseMessages(responseXML) {
    // no matches returned
    if (responseXML == null) {
        return false;
    } else {
        var products = responseXML.getElementsByTagName("book")[0];
        console.log("Product products-"+products.childNodes.length);
        if (products.childNodes.length > 0) {
            completeTable.setAttribute("bordercolor", "black");
            completeTable.setAttribute("border", "1");
            for (loop = 0; loop < products.childNodes.length; loop++) {
                var product = products.childNodes[loop];
                var productName = product.getElementsByTagName("bookTitle")[0];
                var productId = product.getElementsByTagName("bookIsbn")[0];
                console.log("Product name-"+productName);
                console.log("Product ISBN-"+productId);
                appendProduct(productName.childNodes[0].nodeValue,
                productId.childNodes[0].nodeValue);
            }
        }
    }
}

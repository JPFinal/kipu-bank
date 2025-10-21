# 🏦 KipuBank

KipuBank es un contrato inteligente escrito en Solidity que permite a los usuarios depositar y retirar ETH de una bóveda personal, respetando límites de seguridad por transacción y un tope global de depósitos. El contrato sigue buenas prácticas de seguridad, incluye errores personalizados, eventos, y está verificado en la testnet Sepolia.

---

## 🚀 Contrato desplegado

- **Dirección:** `0x36360f693109ad2a30cd66200bbe8a4b6e07ec9d`
- **Red:** Sepolia Testnet
- **Verificado en Etherscan:** [Ver contrato en Sepolia](https://sepolia.etherscan.io/address/0x596381026b92da86CDFFBf9BBb280F02E7C072C5)

---

## 🧠 Funcionalidades

- Depósitos de ETH en bóvedas personales
- Retiros limitados por transacción
- Límite global de depósitos (`bankCap`)
- Registro de cantidad de depósitos y retiros
- Emisión de eventos en cada operación exitosa
- Validaciones con errores personalizados
- Transferencias nativas seguras
- Funciones:
  - `deposit()` → `external payable`
  - `withdraw(uint256)` → `external`
  - `viewVault(address)` → `external view`
  - `_safeTransfer(address,uint256)` → `private`

---

## 🔐 Seguridad aplicada

- Uso de errores personalizados (`DepositLimitReached`, `WithdrawLimitExceeded`, `InsufficientBalance`)
- Patrón **checks-effects-interactions**
- Modificador `withinBankCap` para validar depósitos
- Transferencias ETH con `call` y verificación de éxito
- Comentarios NatSpec en funciones, errores y variables

---

## 🛠️ Despliegue del contrato

1. Abrí [Remix IDE](https://remix.ethereum.org)
2. Pegá el código en `contracts/KipuBank.sol`
3. Compilá con versión `0.8.20`
4. Conectá MetaMask en red Sepolia
5. En “Deploy & Run Transactions”, seleccioná `Injected Provider - MetaMask`
6. Ingresá los parámetros del constructor:
   - `bankCap`: `1000000000000000000` (1 ETH)
   - `withdrawLimit`: `100000000000000000` (0.1 ETH)
7. Hacé clic en “Deploy” y confirmá en MetaMask

---

## 🔄 Interacción con el contrato

### Desde Remix

- `deposit()` → Enviá ETH usando el campo “Value”
- `withdraw(uint256)` → Retirá hasta el límite permitido
- `viewVault(address)` → Consultá el saldo de cualquier usuario

### Desde Etherscan

1. Abrí la pestaña “Write Contract”
2. Conectá MetaMask
3. Usá las funciones disponibles para interactuar

---

## 📂 Estructura del repositorio

kipu-bank/ 
├── contracts/ 
│ └── KipuBank.sol 
├── README.md

---

## ✨ Créditos

Desarrollado por Juan Duarte como parte del curso ETH Kipu — Talento Tech 2025.


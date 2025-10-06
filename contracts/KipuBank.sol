// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title KipuBank - Bóveda personal de ETH con límites seguros
/// @author Juan
/// @notice Permite depósitos y retiros con límites por usuario y globales
contract KipuBank {
    /// @notice Límite global de depósitos permitido en el contrato
    uint256 public immutable bankCap;

    /// @notice Límite máximo de retiro por transacción
    uint256 public immutable withdrawLimit;

    /// @notice Total depositado en el contrato
    uint256 public totalDeposited;

    /// @notice Total de depósitos realizados
    uint256 public depositCount;

    /// @notice Total de retiros realizados
    uint256 public withdrawalCount;

    /// @notice Mapeo de bóvedas personales por usuario
    mapping(address => uint256) private vaults;

    /// @notice Se emite cuando un usuario deposita ETH
    event Deposited(address indexed user, uint256 amount);

    /// @notice Se emite cuando un usuario retira ETH
    event Withdrawn(address indexed user, uint256 amount);

    /// @notice Error si el depósito supera el límite global
    error DepositLimitReached();

    /// @notice Error si el retiro supera el límite por transacción
    error WithdrawLimitExceeded();

    /// @notice Error si el usuario no tiene suficiente saldo
    error InsufficientBalance();

    /// @dev Modificador que valida que el depósito no exceda el límite global
    modifier withinBankCap(uint256 amount) {
        if (totalDeposited + amount > bankCap) revert DepositLimitReached();
        _;
    }

    /// @notice Constructor que define los límites iniciales
    /// @param _bankCap Límite total de depósitos
    /// @param _withdrawLimit Límite por retiro
    constructor(uint256 _bankCap, uint256 _withdrawLimit) {
        bankCap = _bankCap;
        withdrawLimit = _withdrawLimit;
    }

    /// @notice Deposita ETH en la bóveda personal
    /// @dev Sigue el patrón checks-effects-interactions
}

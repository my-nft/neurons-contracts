// File: openzeppelin-contracts-upgradeable/contracts/utils/AddressUpgradeable.sol

// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.7.0) (utils/Address.sol)

pragma solidity ^0.8.1;

/**
 * @dev Collection of functions related to the address type
 */
library AddressUpgradeable {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     *
     * [IMPORTANT]
     * ====
     * You shouldn't rely on `isContract` to protect against flash loan attacks!
     *
     * Preventing calls from contracts is highly discouraged. It breaks composability, breaks support for smart wallets
     * like Gnosis Safe, and does not provide security since it can be circumvented by calling from a contract
     * constructor.
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies on extcodesize/address.code.length, which returns 0
        // for contracts in construction, since the code is only stored at the end
        // of the constructor execution.

        return account.code.length > 0;
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://consensys.net/diligence/blog/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        (bool success, ) = recipient.call{value: amount}("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain `call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        (bool success, bytes memory returndata) = target.call{value: value}(data);
        return verifyCallResultFromTarget(target, success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal view returns (bytes memory) {
        (bool success, bytes memory returndata) = target.staticcall(data);
        return verifyCallResultFromTarget(target, success, returndata, errorMessage);
    }

    /**
     * @dev Tool to verify that a low level call to smart-contract was successful, and revert (either by bubbling
     * the revert reason or using the provided one) in case of unsuccessful call or if target was not a contract.
     *
     * _Available since v4.8._
     */
    function verifyCallResultFromTarget(
        address target,
        bool success,
        bytes memory returndata,
        string memory errorMessage
    ) internal view returns (bytes memory) {
        if (success) {
            if (returndata.length == 0) {
                // only check isContract if the call was successful and the return data is empty
                // otherwise we already know that it was a contract
                require(isContract(target), "Address: call to non-contract");
            }
            return returndata;
        } else {
            _revert(returndata, errorMessage);
        }
    }

    /**
     * @dev Tool to verify that a low level call was successful, and revert if it wasn't, either by bubbling the
     * revert reason or using the provided one.
     *
     * _Available since v4.3._
     */
    function verifyCallResult(
        bool success,
        bytes memory returndata,
        string memory errorMessage
    ) internal pure returns (bytes memory) {
        if (success) {
            return returndata;
        } else {
            _revert(returndata, errorMessage);
        }
    }

    function _revert(bytes memory returndata, string memory errorMessage) private pure {
        // Look for revert reason and bubble it up if present
        if (returndata.length > 0) {
            // The easiest way to bubble the revert reason is using memory via assembly
            /// @solidity memory-safe-assembly
            assembly {
                let returndata_size := mload(returndata)
                revert(add(32, returndata), returndata_size)
            }
        } else {
            revert(errorMessage);
        }
    }
}

// File: openzeppelin-contracts-upgradeable/contracts/proxy/utils/Initializable.sol


// OpenZeppelin Contracts (last updated v4.7.0) (proxy/utils/Initializable.sol)

pragma solidity ^0.8.2;

/**
 * @dev This is a base contract to aid in writing upgradeable contracts, or any kind of contract that will be deployed
 * behind a proxy. Since proxied contracts do not make use of a constructor, it's common to move constructor logic to an
 * external initializer function, usually called `initialize`. It then becomes necessary to protect this initializer
 * function so it can only be called once. The {initializer} modifier provided by this contract will have this effect.
 *
 * The initialization functions use a version number. Once a version number is used, it is consumed and cannot be
 * reused. This mechanism prevents re-execution of each "step" but allows the creation of new initialization steps in
 * case an upgrade adds a module that needs to be initialized.
 *
 * For example:
 *
 * [.hljs-theme-light.nopadding]
 * ```
 * contract MyToken is ERC20Upgradeable {
 *     function initialize() initializer public {
 *         __ERC20_init("MyToken", "MTK");
 *     }
 * }
 * contract MyTokenV2 is MyToken, ERC20PermitUpgradeable {
 *     function initializeV2() reinitializer(2) public {
 *         __ERC20Permit_init("MyToken");
 *     }
 * }
 * ```
 *
 * TIP: To avoid leaving the proxy in an uninitialized state, the initializer function should be called as early as
 * possible by providing the encoded function call as the `_data` argument to {ERC1967Proxy-constructor}.
 *
 * CAUTION: When used with inheritance, manual care must be taken to not invoke a parent initializer twice, or to ensure
 * that all initializers are idempotent. This is not verified automatically as constructors are by Solidity.
 *
 * [CAUTION]
 * ====
 * Avoid leaving a contract uninitialized.
 *
 * An uninitialized contract can be taken over by an attacker. This applies to both a proxy and its implementation
 * contract, which may impact the proxy. To prevent the implementation contract from being used, you should invoke
 * the {_disableInitializers} function in the constructor to automatically lock it when it is deployed:
 *
 * [.hljs-theme-light.nopadding]
 * ```
 * /// @custom:oz-upgrades-unsafe-allow constructor
 * constructor() {
 *     _disableInitializers();
 * }
 * ```
 * ====
 */
abstract contract Initializable {
    /**
     * @dev Indicates that the contract has been initialized.
     * @custom:oz-retyped-from bool
     */
    uint8 private _initialized;

    /**
     * @dev Indicates that the contract is in the process of being initialized.
     */
    bool private _initializing;

    /**
     * @dev Triggered when the contract has been initialized or reinitialized.
     */
    event Initialized(uint8 version);

    /**
     * @dev A modifier that defines a protected initializer function that can be invoked at most once. In its scope,
     * `onlyInitializing` functions can be used to initialize parent contracts.
     *
     * Similar to `reinitializer(1)`, except that functions marked with `initializer` can be nested in the context of a
     * constructor.
     *
     * Emits an {Initialized} event.
     */
    modifier initializer() {
        bool isTopLevelCall = !_initializing;
        require(
            (isTopLevelCall && _initialized < 1) || (!AddressUpgradeable.isContract(address(this)) && _initialized == 1),
            "Initializable: contract is already initialized"
        );
        _initialized = 1;
        if (isTopLevelCall) {
            _initializing = true;
        }
        _;
        if (isTopLevelCall) {
            _initializing = false;
            emit Initialized(1);
        }
    }

    /**
     * @dev A modifier that defines a protected reinitializer function that can be invoked at most once, and only if the
     * contract hasn't been initialized to a greater version before. In its scope, `onlyInitializing` functions can be
     * used to initialize parent contracts.
     *
     * A reinitializer may be used after the original initialization step. This is essential to configure modules that
     * are added through upgrades and that require initialization.
     *
     * When `version` is 1, this modifier is similar to `initializer`, except that functions marked with `reinitializer`
     * cannot be nested. If one is invoked in the context of another, execution will revert.
     *
     * Note that versions can jump in increments greater than 1; this implies that if multiple reinitializers coexist in
     * a contract, executing them in the right order is up to the developer or operator.
     *
     * WARNING: setting the version to 255 will prevent any future reinitialization.
     *
     * Emits an {Initialized} event.
     */
    modifier reinitializer(uint8 version) {
        require(!_initializing && _initialized < version, "Initializable: contract is already initialized");
        _initialized = version;
        _initializing = true;
        _;
        _initializing = false;
        emit Initialized(version);
    }

    /**
     * @dev Modifier to protect an initialization function so that it can only be invoked by functions with the
     * {initializer} and {reinitializer} modifiers, directly or indirectly.
     */
    modifier onlyInitializing() {
        require(_initializing, "Initializable: contract is not initializing");
        _;
    }

    /**
     * @dev Locks the contract, preventing any future reinitialization. This cannot be part of an initializer call.
     * Calling this in the constructor of a contract will prevent that contract from being initialized or reinitialized
     * to any version. It is recommended to use this to lock implementation contracts that are designed to be called
     * through proxies.
     *
     * Emits an {Initialized} event the first time it is successfully executed.
     */
    function _disableInitializers() internal virtual {
        require(!_initializing, "Initializable: contract is initializing");
        if (_initialized != type(uint8).max) {
            _initialized = type(uint8).max;
            emit Initialized(type(uint8).max);
        }
    }

    /**
     * @dev Internal function that returns the initialized version. Returns `_initialized`
     */
    function _getInitializedVersion() internal view returns (uint8) {
        return _initialized;
    }

    /**
     * @dev Internal function that returns the initialized version. Returns `_initializing`
     */
    function _isInitializing() internal view returns (bool) {
        return _initializing;
    }
}

// File: openzeppelin-contracts-upgradeable/contracts/utils/ContextUpgradeable.sol


// OpenZeppelin Contracts v4.4.1 (utils/Context.sol)

pragma solidity ^0.8.0;

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract ContextUpgradeable is Initializable {
    function __Context_init() internal onlyInitializing {
    }

    function __Context_init_unchained() internal onlyInitializing {
    }
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}

// File: openzeppelin-contracts-upgradeable/contracts/access/IAccessControlUpgradeable.sol


// OpenZeppelin Contracts v4.4.1 (access/IAccessControl.sol)

pragma solidity ^0.8.0;

/**
 * @dev External interface of AccessControl declared to support ERC165 detection.
 */
interface IAccessControlUpgradeable {
    /**
     * @dev Emitted when `newAdminRole` is set as ``role``'s admin role, replacing `previousAdminRole`
     *
     * `DEFAULT_ADMIN_ROLE` is the starting admin for all roles, despite
     * {RoleAdminChanged} not being emitted signaling this.
     *
     * _Available since v3.1._
     */
    event RoleAdminChanged(bytes32 indexed role, bytes32 indexed previousAdminRole, bytes32 indexed newAdminRole);

    /**
     * @dev Emitted when `account` is granted `role`.
     *
     * `sender` is the account that originated the contract call, an admin role
     * bearer except when using {AccessControl-_setupRole}.
     */
    event RoleGranted(bytes32 indexed role, address indexed account, address indexed sender);

    /**
     * @dev Emitted when `account` is revoked `role`.
     *
     * `sender` is the account that originated the contract call:
     *   - if using `revokeRole`, it is the admin role bearer
     *   - if using `renounceRole`, it is the role bearer (i.e. `account`)
     */
    event RoleRevoked(bytes32 indexed role, address indexed account, address indexed sender);

    /**
     * @dev Returns `true` if `account` has been granted `role`.
     */
    function hasRole(bytes32 role, address account) external view returns (bool);

    /**
     * @dev Returns the admin role that controls `role`. See {grantRole} and
     * {revokeRole}.
     *
     * To change a role's admin, use {AccessControl-_setRoleAdmin}.
     */
    function getRoleAdmin(bytes32 role) external view returns (bytes32);

    /**
     * @dev Grants `role` to `account`.
     *
     * If `account` had not been already granted `role`, emits a {RoleGranted}
     * event.
     *
     * Requirements:
     *
     * - the caller must have ``role``'s admin role.
     */
    function grantRole(bytes32 role, address account) external;

    /**
     * @dev Revokes `role` from `account`.
     *
     * If `account` had been granted `role`, emits a {RoleRevoked} event.
     *
     * Requirements:
     *
     * - the caller must have ``role``'s admin role.
     */
    function revokeRole(bytes32 role, address account) external;

    /**
     * @dev Revokes `role` from the calling account.
     *
     * Roles are often managed via {grantRole} and {revokeRole}: this function's
     * purpose is to provide a mechanism for accounts to lose their privileges
     * if they are compromised (such as when a trusted device is misplaced).
     *
     * If the calling account had been granted `role`, emits a {RoleRevoked}
     * event.
     *
     * Requirements:
     *
     * - the caller must be `account`.
     */
    function renounceRole(bytes32 role, address account) external;
}

// File: openzeppelin-contracts-upgradeable/contracts/utils/math/MathUpgradeable.sol


// OpenZeppelin Contracts (last updated v4.7.0) (utils/math/Math.sol)

pragma solidity ^0.8.0;

/**
 * @dev Standard math utilities missing in the Solidity language.
 */
library MathUpgradeable {
    enum Rounding {
        Down, // Toward negative infinity
        Up, // Toward infinity
        Zero // Toward zero
    }

    /**
     * @dev Returns the largest of two numbers.
     */
    function max(uint256 a, uint256 b) internal pure returns (uint256) {
        return a > b ? a : b;
    }

    /**
     * @dev Returns the smallest of two numbers.
     */
    function min(uint256 a, uint256 b) internal pure returns (uint256) {
        return a < b ? a : b;
    }

    /**
     * @dev Returns the average of two numbers. The result is rounded towards
     * zero.
     */
    function average(uint256 a, uint256 b) internal pure returns (uint256) {
        // (a + b) / 2 can overflow.
        return (a & b) + (a ^ b) / 2;
    }

    /**
     * @dev Returns the ceiling of the division of two numbers.
     *
     * This differs from standard division with `/` in that it rounds up instead
     * of rounding down.
     */
    function ceilDiv(uint256 a, uint256 b) internal pure returns (uint256) {
        // (a + b - 1) / b can overflow on addition, so we distribute.
        return a == 0 ? 0 : (a - 1) / b + 1;
    }

    /**
     * @notice Calculates floor(x * y / denominator) with full precision. Throws if result overflows a uint256 or denominator == 0
     * @dev Original credit to Remco Bloemen under MIT license (https://xn--2-umb.com/21/muldiv)
     * with further edits by Uniswap Labs also under MIT license.
     */
    function mulDiv(
        uint256 x,
        uint256 y,
        uint256 denominator
    ) internal pure returns (uint256 result) {
        unchecked {
            // 512-bit multiply [prod1 prod0] = x * y. Compute the product mod 2^256 and mod 2^256 - 1, then use
            // use the Chinese Remainder Theorem to reconstruct the 512 bit result. The result is stored in two 256
            // variables such that product = prod1 * 2^256 + prod0.
            uint256 prod0; // Least significant 256 bits of the product
            uint256 prod1; // Most significant 256 bits of the product
            assembly {
                let mm := mulmod(x, y, not(0))
                prod0 := mul(x, y)
                prod1 := sub(sub(mm, prod0), lt(mm, prod0))
            }

            // Handle non-overflow cases, 256 by 256 division.
            if (prod1 == 0) {
                return prod0 / denominator;
            }

            // Make sure the result is less than 2^256. Also prevents denominator == 0.
            require(denominator > prod1);

            ///////////////////////////////////////////////
            // 512 by 256 division.
            ///////////////////////////////////////////////

            // Make division exact by subtracting the remainder from [prod1 prod0].
            uint256 remainder;
            assembly {
                // Compute remainder using mulmod.
                remainder := mulmod(x, y, denominator)

                // Subtract 256 bit number from 512 bit number.
                prod1 := sub(prod1, gt(remainder, prod0))
                prod0 := sub(prod0, remainder)
            }

            // Factor powers of two out of denominator and compute largest power of two divisor of denominator. Always >= 1.
            // See https://cs.stackexchange.com/q/138556/92363.

            // Does not overflow because the denominator cannot be zero at this stage in the function.
            uint256 twos = denominator & (~denominator + 1);
            assembly {
                // Divide denominator by twos.
                denominator := div(denominator, twos)

                // Divide [prod1 prod0] by twos.
                prod0 := div(prod0, twos)

                // Flip twos such that it is 2^256 / twos. If twos is zero, then it becomes one.
                twos := add(div(sub(0, twos), twos), 1)
            }

            // Shift in bits from prod1 into prod0.
            prod0 |= prod1 * twos;

            // Invert denominator mod 2^256. Now that denominator is an odd number, it has an inverse modulo 2^256 such
            // that denominator * inv = 1 mod 2^256. Compute the inverse by starting with a seed that is correct for
            // four bits. That is, denominator * inv = 1 mod 2^4.
            uint256 inverse = (3 * denominator) ^ 2;

            // Use the Newton-Raphson iteration to improve the precision. Thanks to Hensel's lifting lemma, this also works
            // in modular arithmetic, doubling the correct bits in each step.
            inverse *= 2 - denominator * inverse; // inverse mod 2^8
            inverse *= 2 - denominator * inverse; // inverse mod 2^16
            inverse *= 2 - denominator * inverse; // inverse mod 2^32
            inverse *= 2 - denominator * inverse; // inverse mod 2^64
            inverse *= 2 - denominator * inverse; // inverse mod 2^128
            inverse *= 2 - denominator * inverse; // inverse mod 2^256

            // Because the division is now exact we can divide by multiplying with the modular inverse of denominator.
            // This will give us the correct result modulo 2^256. Since the preconditions guarantee that the outcome is
            // less than 2^256, this is the final result. We don't need to compute the high bits of the result and prod1
            // is no longer required.
            result = prod0 * inverse;
            return result;
        }
    }

    /**
     * @notice Calculates x * y / denominator with full precision, following the selected rounding direction.
     */
    function mulDiv(
        uint256 x,
        uint256 y,
        uint256 denominator,
        Rounding rounding
    ) internal pure returns (uint256) {
        uint256 result = mulDiv(x, y, denominator);
        if (rounding == Rounding.Up && mulmod(x, y, denominator) > 0) {
            result += 1;
        }
        return result;
    }

    /**
     * @dev Returns the square root of a number. If the number is not a perfect square, the value is rounded down.
     *
     * Inspired by Henry S. Warren, Jr.'s "Hacker's Delight" (Chapter 11).
     */
    function sqrt(uint256 a) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }

        // For our first guess, we get the biggest power of 2 which is smaller than the square root of the target.
        //
        // We know that the "msb" (most significant bit) of our target number `a` is a power of 2 such that we have
        // `msb(a) <= a < 2*msb(a)`. This value can be written `msb(a)=2**k` with `k=log2(a)`.
        //
        // This can be rewritten `2**log2(a) <= a < 2**(log2(a) + 1)`
        // → `sqrt(2**k) <= sqrt(a) < sqrt(2**(k+1))`
        // → `2**(k/2) <= sqrt(a) < 2**((k+1)/2) <= 2**(k/2 + 1)`
        //
        // Consequently, `2**(log2(a) / 2)` is a good first approximation of `sqrt(a)` with at least 1 correct bit.
        uint256 result = 1 << (log2(a) >> 1);

        // At this point `result` is an estimation with one bit of precision. We know the true value is a uint128,
        // since it is the square root of a uint256. Newton's method converges quadratically (precision doubles at
        // every iteration). We thus need at most 7 iteration to turn our partial result with one bit of precision
        // into the expected uint128 result.
        unchecked {
            result = (result + a / result) >> 1;
            result = (result + a / result) >> 1;
            result = (result + a / result) >> 1;
            result = (result + a / result) >> 1;
            result = (result + a / result) >> 1;
            result = (result + a / result) >> 1;
            result = (result + a / result) >> 1;
            return min(result, a / result);
        }
    }

    /**
     * @notice Calculates sqrt(a), following the selected rounding direction.
     */
    function sqrt(uint256 a, Rounding rounding) internal pure returns (uint256) {
        unchecked {
            uint256 result = sqrt(a);
            return result + (rounding == Rounding.Up && result * result < a ? 1 : 0);
        }
    }

    /**
     * @dev Return the log in base 2, rounded down, of a positive value.
     * Returns 0 if given 0.
     */
    function log2(uint256 value) internal pure returns (uint256) {
        uint256 result = 0;
        unchecked {
            if (value >> 128 > 0) {
                value >>= 128;
                result += 128;
            }
            if (value >> 64 > 0) {
                value >>= 64;
                result += 64;
            }
            if (value >> 32 > 0) {
                value >>= 32;
                result += 32;
            }
            if (value >> 16 > 0) {
                value >>= 16;
                result += 16;
            }
            if (value >> 8 > 0) {
                value >>= 8;
                result += 8;
            }
            if (value >> 4 > 0) {
                value >>= 4;
                result += 4;
            }
            if (value >> 2 > 0) {
                value >>= 2;
                result += 2;
            }
            if (value >> 1 > 0) {
                result += 1;
            }
        }
        return result;
    }

    /**
     * @dev Return the log in base 2, following the selected rounding direction, of a positive value.
     * Returns 0 if given 0.
     */
    function log2(uint256 value, Rounding rounding) internal pure returns (uint256) {
        unchecked {
            uint256 result = log2(value);
            return result + (rounding == Rounding.Up && 1 << result < value ? 1 : 0);
        }
    }

    /**
     * @dev Return the log in base 10, rounded down, of a positive value.
     * Returns 0 if given 0.
     */
    function log10(uint256 value) internal pure returns (uint256) {
        uint256 result = 0;
        unchecked {
            if (value >= 10**64) {
                value /= 10**64;
                result += 64;
            }
            if (value >= 10**32) {
                value /= 10**32;
                result += 32;
            }
            if (value >= 10**16) {
                value /= 10**16;
                result += 16;
            }
            if (value >= 10**8) {
                value /= 10**8;
                result += 8;
            }
            if (value >= 10**4) {
                value /= 10**4;
                result += 4;
            }
            if (value >= 10**2) {
                value /= 10**2;
                result += 2;
            }
            if (value >= 10**1) {
                result += 1;
            }
        }
        return result;
    }

    /**
     * @dev Return the log in base 10, following the selected rounding direction, of a positive value.
     * Returns 0 if given 0.
     */
    function log10(uint256 value, Rounding rounding) internal pure returns (uint256) {
        unchecked {
            uint256 result = log10(value);
            return result + (rounding == Rounding.Up && 10**result < value ? 1 : 0);
        }
    }

    /**
     * @dev Return the log in base 256, rounded down, of a positive value.
     * Returns 0 if given 0.
     *
     * Adding one to the result gives the number of pairs of hex symbols needed to represent `value` as a hex string.
     */
    function log256(uint256 value) internal pure returns (uint256) {
        uint256 result = 0;
        unchecked {
            if (value >> 128 > 0) {
                value >>= 128;
                result += 16;
            }
            if (value >> 64 > 0) {
                value >>= 64;
                result += 8;
            }
            if (value >> 32 > 0) {
                value >>= 32;
                result += 4;
            }
            if (value >> 16 > 0) {
                value >>= 16;
                result += 2;
            }
            if (value >> 8 > 0) {
                result += 1;
            }
        }
        return result;
    }

    /**
     * @dev Return the log in base 10, following the selected rounding direction, of a positive value.
     * Returns 0 if given 0.
     */
    function log256(uint256 value, Rounding rounding) internal pure returns (uint256) {
        unchecked {
            uint256 result = log256(value);
            return result + (rounding == Rounding.Up && 1 << (result << 3) < value ? 1 : 0);
        }
    }
}

// File: openzeppelin-contracts-upgradeable/contracts/utils/StringsUpgradeable.sol


// OpenZeppelin Contracts (last updated v4.7.0) (utils/Strings.sol)

pragma solidity ^0.8.0;

/**
 * @dev String operations.
 */
library StringsUpgradeable {
    bytes16 private constant _SYMBOLS = "0123456789abcdef";
    uint8 private constant _ADDRESS_LENGTH = 20;

    /**
     * @dev Converts a `uint256` to its ASCII `string` decimal representation.
     */
    function toString(uint256 value) internal pure returns (string memory) {
        unchecked {
            uint256 length = MathUpgradeable.log10(value) + 1;
            string memory buffer = new string(length);
            uint256 ptr;
            /// @solidity memory-safe-assembly
            assembly {
                ptr := add(buffer, add(32, length))
            }
            while (true) {
                ptr--;
                /// @solidity memory-safe-assembly
                assembly {
                    mstore8(ptr, byte(mod(value, 10), _SYMBOLS))
                }
                value /= 10;
                if (value == 0) break;
            }
            return buffer;
        }
    }

    /**
     * @dev Converts a `uint256` to its ASCII `string` hexadecimal representation.
     */
    function toHexString(uint256 value) internal pure returns (string memory) {
        unchecked {
            return toHexString(value, MathUpgradeable.log256(value) + 1);
        }
    }

    /**
     * @dev Converts a `uint256` to its ASCII `string` hexadecimal representation with fixed length.
     */
    function toHexString(uint256 value, uint256 length) internal pure returns (string memory) {
        bytes memory buffer = new bytes(2 * length + 2);
        buffer[0] = "0";
        buffer[1] = "x";
        for (uint256 i = 2 * length + 1; i > 1; --i) {
            buffer[i] = _SYMBOLS[value & 0xf];
            value >>= 4;
        }
        require(value == 0, "Strings: hex length insufficient");
        return string(buffer);
    }

    /**
     * @dev Converts an `address` with fixed length of 20 bytes to its not checksummed ASCII `string` hexadecimal representation.
     */
    function toHexString(address addr) internal pure returns (string memory) {
        return toHexString(uint256(uint160(addr)), _ADDRESS_LENGTH);
    }
}

// File: openzeppelin-contracts-upgradeable/contracts/utils/introspection/IERC165Upgradeable.sol


// OpenZeppelin Contracts v4.4.1 (utils/introspection/IERC165.sol)

pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC165 standard, as defined in the
 * https://eips.ethereum.org/EIPS/eip-165[EIP].
 *
 * Implementers can declare support of contract interfaces, which can then be
 * queried by others ({ERC165Checker}).
 *
 * For an implementation, see {ERC165}.
 */
interface IERC165Upgradeable {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

// File: openzeppelin-contracts-upgradeable/contracts/utils/introspection/ERC165Upgradeable.sol


// OpenZeppelin Contracts v4.4.1 (utils/introspection/ERC165.sol)

pragma solidity ^0.8.0;


/**
 * @dev Implementation of the {IERC165} interface.
 *
 * Contracts that want to implement ERC165 should inherit from this contract and override {supportsInterface} to check
 * for the additional interface id that will be supported. For example:
 *
 * ```solidity
 * function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
 *     return interfaceId == type(MyInterface).interfaceId || super.supportsInterface(interfaceId);
 * }
 * ```
 *
 * Alternatively, {ERC165Storage} provides an easier to use but more expensive implementation.
 */
abstract contract ERC165Upgradeable is Initializable, IERC165Upgradeable {
    function __ERC165_init() internal onlyInitializing {
    }

    function __ERC165_init_unchained() internal onlyInitializing {
    }
    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == type(IERC165Upgradeable).interfaceId;
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}

// File: openzeppelin-contracts-upgradeable/contracts/access/AccessControlUpgradeable.sol


// OpenZeppelin Contracts (last updated v4.7.0) (access/AccessControl.sol)

pragma solidity ^0.8.0;





/**
 * @dev Contract module that allows children to implement role-based access
 * control mechanisms. This is a lightweight version that doesn't allow enumerating role
 * members except through off-chain means by accessing the contract event logs. Some
 * applications may benefit from on-chain enumerability, for those cases see
 * {AccessControlEnumerable}.
 *
 * Roles are referred to by their `bytes32` identifier. These should be exposed
 * in the external API and be unique. The best way to achieve this is by
 * using `public constant` hash digests:
 *
 * ```
 * bytes32 public constant MY_ROLE = keccak256("MY_ROLE");
 * ```
 *
 * Roles can be used to represent a set of permissions. To restrict access to a
 * function call, use {hasRole}:
 *
 * ```
 * function foo() public {
 *     require(hasRole(MY_ROLE, msg.sender));
 *     ...
 * }
 * ```
 *
 * Roles can be granted and revoked dynamically via the {grantRole} and
 * {revokeRole} functions. Each role has an associated admin role, and only
 * accounts that have a role's admin role can call {grantRole} and {revokeRole}.
 *
 * By default, the admin role for all roles is `DEFAULT_ADMIN_ROLE`, which means
 * that only accounts with this role will be able to grant or revoke other
 * roles. More complex role relationships can be created by using
 * {_setRoleAdmin}.
 *
 * WARNING: The `DEFAULT_ADMIN_ROLE` is also its own admin: it has permission to
 * grant and revoke this role. Extra precautions should be taken to secure
 * accounts that have been granted it.
 */
abstract contract AccessControlUpgradeable is Initializable, ContextUpgradeable, IAccessControlUpgradeable, ERC165Upgradeable {
    function __AccessControl_init() internal onlyInitializing {
    }

    function __AccessControl_init_unchained() internal onlyInitializing {
    }
    struct RoleData {
        mapping(address => bool) members;
        bytes32 adminRole;
    }

    mapping(bytes32 => RoleData) private _roles;

    bytes32 public constant DEFAULT_ADMIN_ROLE = 0x00;

    /**
     * @dev Modifier that checks that an account has a specific role. Reverts
     * with a standardized message including the required role.
     *
     * The format of the revert reason is given by the following regular expression:
     *
     *  /^AccessControl: account (0x[0-9a-f]{40}) is missing role (0x[0-9a-f]{64})$/
     *
     * _Available since v4.1._
     */
    modifier onlyRole(bytes32 role) {
        _checkRole(role);
        _;
    }

    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == type(IAccessControlUpgradeable).interfaceId || super.supportsInterface(interfaceId);
    }

    /**
     * @dev Returns `true` if `account` has been granted `role`.
     */
    function hasRole(bytes32 role, address account) public view virtual override returns (bool) {
        return _roles[role].members[account];
    }

    /**
     * @dev Revert with a standard message if `_msgSender()` is missing `role`.
     * Overriding this function changes the behavior of the {onlyRole} modifier.
     *
     * Format of the revert message is described in {_checkRole}.
     *
     * _Available since v4.6._
     */
    function _checkRole(bytes32 role) internal view virtual {
        _checkRole(role, _msgSender());
    }

    /**
     * @dev Revert with a standard message if `account` is missing `role`.
     *
     * The format of the revert reason is given by the following regular expression:
     *
     *  /^AccessControl: account (0x[0-9a-f]{40}) is missing role (0x[0-9a-f]{64})$/
     */
    function _checkRole(bytes32 role, address account) internal view virtual {
        if (!hasRole(role, account)) {
            revert(
                string(
                    abi.encodePacked(
                        "AccessControl: account ",
                        StringsUpgradeable.toHexString(account),
                        " is missing role ",
                        StringsUpgradeable.toHexString(uint256(role), 32)
                    )
                )
            );
        }
    }

    /**
     * @dev Returns the admin role that controls `role`. See {grantRole} and
     * {revokeRole}.
     *
     * To change a role's admin, use {_setRoleAdmin}.
     */
    function getRoleAdmin(bytes32 role) public view virtual override returns (bytes32) {
        return _roles[role].adminRole;
    }

    /**
     * @dev Grants `role` to `account`.
     *
     * If `account` had not been already granted `role`, emits a {RoleGranted}
     * event.
     *
     * Requirements:
     *
     * - the caller must have ``role``'s admin role.
     *
     * May emit a {RoleGranted} event.
     */
    function grantRole(bytes32 role, address account) public virtual override onlyRole(getRoleAdmin(role)) {
        _grantRole(role, account);
    }

    /**
     * @dev Revokes `role` from `account`.
     *
     * If `account` had been granted `role`, emits a {RoleRevoked} event.
     *
     * Requirements:
     *
     * - the caller must have ``role``'s admin role.
     *
     * May emit a {RoleRevoked} event.
     */
    function revokeRole(bytes32 role, address account) public virtual override onlyRole(getRoleAdmin(role)) {
        _revokeRole(role, account);
    }

    /**
     * @dev Revokes `role` from the calling account.
     *
     * Roles are often managed via {grantRole} and {revokeRole}: this function's
     * purpose is to provide a mechanism for accounts to lose their privileges
     * if they are compromised (such as when a trusted device is misplaced).
     *
     * If the calling account had been revoked `role`, emits a {RoleRevoked}
     * event.
     *
     * Requirements:
     *
     * - the caller must be `account`.
     *
     * May emit a {RoleRevoked} event.
     */
    function renounceRole(bytes32 role, address account) public virtual override {
        require(account == _msgSender(), "AccessControl: can only renounce roles for self");

        _revokeRole(role, account);
    }

    /**
     * @dev Grants `role` to `account`.
     *
     * If `account` had not been already granted `role`, emits a {RoleGranted}
     * event. Note that unlike {grantRole}, this function doesn't perform any
     * checks on the calling account.
     *
     * May emit a {RoleGranted} event.
     *
     * [WARNING]
     * ====
     * This function should only be called from the constructor when setting
     * up the initial roles for the system.
     *
     * Using this function in any other way is effectively circumventing the admin
     * system imposed by {AccessControl}.
     * ====
     *
     * NOTE: This function is deprecated in favor of {_grantRole}.
     */
    function _setupRole(bytes32 role, address account) internal virtual {
        _grantRole(role, account);
    }

    /**
     * @dev Sets `adminRole` as ``role``'s admin role.
     *
     * Emits a {RoleAdminChanged} event.
     */
    function _setRoleAdmin(bytes32 role, bytes32 adminRole) internal virtual {
        bytes32 previousAdminRole = getRoleAdmin(role);
        _roles[role].adminRole = adminRole;
        emit RoleAdminChanged(role, previousAdminRole, adminRole);
    }

    /**
     * @dev Grants `role` to `account`.
     *
     * Internal function without access restriction.
     *
     * May emit a {RoleGranted} event.
     */
    function _grantRole(bytes32 role, address account) internal virtual {
        if (!hasRole(role, account)) {
            _roles[role].members[account] = true;
            emit RoleGranted(role, account, _msgSender());
        }
    }

    /**
     * @dev Revokes `role` from `account`.
     *
     * Internal function without access restriction.
     *
     * May emit a {RoleRevoked} event.
     */
    function _revokeRole(bytes32 role, address account) internal virtual {
        if (hasRole(role, account)) {
            _roles[role].members[account] = false;
            emit RoleRevoked(role, account, _msgSender());
        }
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[49] private __gap;
}

// File: contracts/modules/wrapper/optional/AuthorizationModule.sol



pragma solidity ^0.8.17;


abstract contract AuthorizationModule is AccessControlUpgradeable {
    function __AuthorizationModule_init() internal onlyInitializing {
        /* OpenZeppelin */
        __Context_init_unchained();
        // AccessControlUpgradeable inherits from ERC165Upgradeable
        __ERC165_init_unchained();
        __AccessControl_init_unchained();

       /* own function */
        __AuthorizationModule_init_unchained();
    }

    function __AuthorizationModule_init_unchained() internal onlyInitializing {
        // no variable to initialize
    }

    uint256[50] private __gap;
}

// File: contracts/modules/security/OnlyDelegateCallModule.sol



pragma solidity ^0.8.17;

abstract contract OnlyDelegateCallModule {
    /// @custom:oz-upgrades-unsafe-allow state-variable-immutable state-variable-assignment
    address private immutable self = address(this);

    function checkDelegateCall() private view {
        require(address(this) != self, "Direct call to the implementation not allowed");
    }

    modifier onlyDelegateCall(bool deployedWithProxy) {
        if(deployedWithProxy){
            checkDelegateCall();
        }
        _;
    }
}

// File: contracts/modules/wrapper/mandatory/BaseModule.sol



pragma solidity ^0.8.17;

// required OZ imports here



abstract contract BaseModule is AuthorizationModule, OnlyDelegateCallModule {
    bool internal deployedWithProxy;
    /* Events */
    event TermSet(string indexed newTerm);
    event TokenIdSet(string indexed newTokenId);

    /* Variables */
    string public tokenId;
    string public terms;

    /* Initializers */
    /**
     * @dev Sets the values for {name} and {symbol}.
     *
     * All two of these values are immutable: they can only be set once during
     * construction.
     */
    function __Base_init(
        string memory tokenId_,
        string memory terms_
    ) internal onlyInitializing {
         /* OpenZeppelin */
        __Context_init_unchained();
         // AccessControlUpgradeable inherits from ERC165Upgradeable
        __ERC165_init_unchained();
        // AuthorizationModule inherits from AccessControlUpgradeable
        __AccessControl_init_unchained();

         /* Wrapper */
        __AuthorizationModule_init_unchained();

        /* own function */
        __Base_init_unchained(tokenId_, terms_);
    }

    function __Base_init_unchained(
        string memory tokenId_,
        string memory terms_
    ) internal onlyInitializing {
        tokenId = tokenId_;
        terms = terms_;
    }

    /* Methods */
    function setTokenId(string memory tokenId_)
        public
        onlyRole(DEFAULT_ADMIN_ROLE)
    {
        tokenId = tokenId_;
        emit TokenIdSet(tokenId_);
    }

    function setTerms(string memory terms_)
        public
        onlyRole(DEFAULT_ADMIN_ROLE)
    {
        terms = terms_;
        emit TermSet(terms_);
    }

    /// @custom:oz-upgrades-unsafe-allow selfdestruct
    function kill() public onlyRole(DEFAULT_ADMIN_ROLE) onlyDelegateCall(deployedWithProxy) {
        selfdestruct(payable(_msgSender()));
    }

    uint256[50] private __gap;
}

// File: openzeppelin-contracts-upgradeable/contracts/token/ERC20/IERC20Upgradeable.sol


// OpenZeppelin Contracts (last updated v4.6.0) (token/ERC20/IERC20.sol)

pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20Upgradeable {
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `from` to `to` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}

// File: openzeppelin-contracts-upgradeable/contracts/token/ERC20/extensions/IERC20MetadataUpgradeable.sol


// OpenZeppelin Contracts v4.4.1 (token/ERC20/extensions/IERC20Metadata.sol)

pragma solidity ^0.8.0;

/**
 * @dev Interface for the optional metadata functions from the ERC20 standard.
 *
 * _Available since v4.1._
 */
interface IERC20MetadataUpgradeable is IERC20Upgradeable {
    /**
     * @dev Returns the name of the token.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the symbol of the token.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the decimals places of the token.
     */
    function decimals() external view returns (uint8);
}

// File: openzeppelin-contracts-upgradeable/contracts/token/ERC20/ERC20Upgradeable.sol


// OpenZeppelin Contracts (last updated v4.7.0) (token/ERC20/ERC20.sol)

pragma solidity ^0.8.0;




/**
 * @dev Implementation of the {IERC20} interface.
 *
 * This implementation is agnostic to the way tokens are created. This means
 * that a supply mechanism has to be added in a derived contract using {_mint}.
 * For a generic mechanism see {ERC20PresetMinterPauser}.
 *
 * TIP: For a detailed writeup see our guide
 * https://forum.openzeppelin.com/t/how-to-implement-erc20-supply-mechanisms/226[How
 * to implement supply mechanisms].
 *
 * We have followed general OpenZeppelin Contracts guidelines: functions revert
 * instead returning `false` on failure. This behavior is nonetheless
 * conventional and does not conflict with the expectations of ERC20
 * applications.
 *
 * Additionally, an {Approval} event is emitted on calls to {transferFrom}.
 * This allows applications to reconstruct the allowance for all accounts just
 * by listening to said events. Other implementations of the EIP may not emit
 * these events, as it isn't required by the specification.
 *
 * Finally, the non-standard {decreaseAllowance} and {increaseAllowance}
 * functions have been added to mitigate the well-known issues around setting
 * allowances. See {IERC20-approve}.
 */
contract ERC20Upgradeable is Initializable, ContextUpgradeable, IERC20Upgradeable, IERC20MetadataUpgradeable {
    mapping(address => uint256) private _balances;

    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;

    /**
     * @dev Sets the values for {name} and {symbol}.
     *
     * The default value of {decimals} is 18. To select a different value for
     * {decimals} you should overload it.
     *
     * All two of these values are immutable: they can only be set once during
     * construction.
     */
    function __ERC20_init(string memory name_, string memory symbol_) internal onlyInitializing {
        __ERC20_init_unchained(name_, symbol_);
    }

    function __ERC20_init_unchained(string memory name_, string memory symbol_) internal onlyInitializing {
        _name = name_;
        _symbol = symbol_;
    }

    /**
     * @dev Returns the name of the token.
     */
    function name() public view virtual override returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5.05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei. This is the value {ERC20} uses, unless this function is
     * overridden;
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view virtual override returns (uint8) {
        return 18;
    }

    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address account) public view virtual override returns (uint256) {
        return _balances[account];
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `to` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        _transfer(owner, to, amount);
        return true;
    }

    /**
     * @dev See {IERC20-allowance}.
     */
    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * NOTE: If `amount` is the maximum `uint256`, the allowance is not updated on
     * `transferFrom`. This is semantically equivalent to an infinite approval.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        _approve(owner, spender, amount);
        return true;
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {ERC20}.
     *
     * NOTE: Does not update the allowance if the current allowance
     * is the maximum `uint256`.
     *
     * Requirements:
     *
     * - `from` and `to` cannot be the zero address.
     * - `from` must have a balance of at least `amount`.
     * - the caller must have allowance for ``from``'s tokens of at least
     * `amount`.
     */
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public virtual override returns (bool) {
        address spender = _msgSender();
        _spendAllowance(from, spender, amount);
        _transfer(from, to, amount);
        return true;
    }

    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        address owner = _msgSender();
        _approve(owner, spender, allowance(owner, spender) + addedValue);
        return true;
    }

    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        address owner = _msgSender();
        uint256 currentAllowance = allowance(owner, spender);
        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");
        unchecked {
            _approve(owner, spender, currentAllowance - subtractedValue);
        }

        return true;
    }

    /**
     * @dev Moves `amount` of tokens from `from` to `to`.
     *
     * This internal function is equivalent to {transfer}, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a {Transfer} event.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `from` must have a balance of at least `amount`.
     */
    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(from, to, amount);

        uint256 fromBalance = _balances[from];
        require(fromBalance >= amount, "ERC20: transfer amount exceeds balance");
        unchecked {
            _balances[from] = fromBalance - amount;
            // Overflow not possible: the sum of all balances is capped by totalSupply, and the sum is preserved by
            // decrementing then incrementing.
            _balances[to] += amount;
        }

        emit Transfer(from, to, amount);

        _afterTokenTransfer(from, to, amount);
    }

    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a {Transfer} event with `from` set to the zero address.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     */
    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to the zero address");

        _beforeTokenTransfer(address(0), account, amount);

        _totalSupply += amount;
        unchecked {
            // Overflow not possible: balance + amount is at most totalSupply + amount, which is checked above.
            _balances[account] += amount;
        }
        emit Transfer(address(0), account, amount);

        _afterTokenTransfer(address(0), account, amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`, reducing the
     * total supply.
     *
     * Emits a {Transfer} event with `to` set to the zero address.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     * - `account` must have at least `amount` tokens.
     */
    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from the zero address");

        _beforeTokenTransfer(account, address(0), amount);

        uint256 accountBalance = _balances[account];
        require(accountBalance >= amount, "ERC20: burn amount exceeds balance");
        unchecked {
            _balances[account] = accountBalance - amount;
            // Overflow not possible: amount <= accountBalance <= totalSupply.
            _totalSupply -= amount;
        }

        emit Transfer(account, address(0), amount);

        _afterTokenTransfer(account, address(0), amount);
    }

    /**
     * @dev Sets `amount` as the allowance of `spender` over the `owner` s tokens.
     *
     * This internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     */
    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    /**
     * @dev Updates `owner` s allowance for `spender` based on spent `amount`.
     *
     * Does not update the allowance amount in case of infinite allowance.
     * Revert if not enough allowance is available.
     *
     * Might emit an {Approval} event.
     */
    function _spendAllowance(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {
        uint256 currentAllowance = allowance(owner, spender);
        if (currentAllowance != type(uint256).max) {
            require(currentAllowance >= amount, "ERC20: insufficient allowance");
            unchecked {
                _approve(owner, spender, currentAllowance - amount);
            }
        }
    }

    /**
     * @dev Hook that is called before any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * will be transferred to `to`.
     * - when `from` is zero, `amount` tokens will be minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens will be burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {}

    /**
     * @dev Hook that is called after any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * has been transferred to `to`.
     * - when `from` is zero, `amount` tokens have been minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens have been burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _afterTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {}

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[45] private __gap;
}

// File: contracts/modules/wrapper/mandatory/BurnModule.sol



pragma solidity ^0.8.17;



abstract contract BurnModule is ERC20Upgradeable, AuthorizationModule {
    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");
    event Burn(address indexed owner, uint256 amount);

    function __BurnModule_init(string memory name_, string memory symbol_) internal onlyInitializing {
        /* OpenZeppelin */
        __Context_init_unchained();
        __ERC20_init_unchained(name_, symbol_);
        // AccessControlUpgradeable inherits from ERC165Upgradeable
        __ERC165_init_unchained();
        // AuthorizationModule inherits from AccessControlUpgradeable
        __AccessControl_init_unchained();

        /* Wrapper */
        __AuthorizationModule_init_unchained();

        /* own function */
        __BurnModule_init_unchained();
    }

    function __BurnModule_init_unchained() internal onlyInitializing {
        // no variable to initialize
    }

    /**
     * @dev Destroys `amount` tokens from `account`
     *
     * See {ERC20-_burn}
     */
    function forceBurn(address from, uint256 amount)
        public
        onlyRole(BURNER_ROLE)
    {
        _burn(from, amount);
        emit Burn(from, amount);
    }

    uint256[50] private __gap;
}

// File: contracts/modules/wrapper/mandatory/MintModule.sol



pragma solidity ^0.8.17;



abstract contract MintModule is ERC20Upgradeable, AuthorizationModule {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    event Mint(address indexed beneficiary, uint256 amount);

    function __MintModule_init(string memory name_, string memory symbol_) internal onlyInitializing {
        /* OpenZeppelin */
        __Context_init_unchained();
        __ERC20_init_unchained(name_, symbol_);
        // AccessControlUpgradeable inherits from ERC165Upgradeable
        __ERC165_init_unchained();
        // AuthorizationModule inherits from AccessControlUpgradeable
        __AccessControl_init_unchained();

        /* Wrapper */
        __AuthorizationModule_init_unchained();

        /* own function */
        __MintModule_init_unchained();
    }

    function __MintModule_init_unchained() internal onlyInitializing {
        // no variable to initialize
    }

     /**
     * @dev Creates `amount` new tokens for `to`.
     *
     * See {ERC20-_mint}.
     *
     * Requirements:
     *
     * - the caller must have the `MINTER_ROLE`.
     */
    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
        emit Mint(to, amount);
    }

    uint256[50] private __gap;
}

// File: openzeppelin-contracts-upgradeable/contracts/security/PausableUpgradeable.sol


// OpenZeppelin Contracts (last updated v4.7.0) (security/Pausable.sol)

pragma solidity ^0.8.0;


/**
 * @dev Contract module which allows children to implement an emergency stop
 * mechanism that can be triggered by an authorized account.
 *
 * This module is used through inheritance. It will make available the
 * modifiers `whenNotPaused` and `whenPaused`, which can be applied to
 * the functions of your contract. Note that they will not be pausable by
 * simply including this module, only once the modifiers are put in place.
 */
abstract contract PausableUpgradeable is Initializable, ContextUpgradeable {
    /**
     * @dev Emitted when the pause is triggered by `account`.
     */
    event Paused(address account);

    /**
     * @dev Emitted when the pause is lifted by `account`.
     */
    event Unpaused(address account);

    bool private _paused;

    /**
     * @dev Initializes the contract in unpaused state.
     */
    function __Pausable_init() internal onlyInitializing {
        __Pausable_init_unchained();
    }

    function __Pausable_init_unchained() internal onlyInitializing {
        _paused = false;
    }

    /**
     * @dev Modifier to make a function callable only when the contract is not paused.
     *
     * Requirements:
     *
     * - The contract must not be paused.
     */
    modifier whenNotPaused() {
        _requireNotPaused();
        _;
    }

    /**
     * @dev Modifier to make a function callable only when the contract is paused.
     *
     * Requirements:
     *
     * - The contract must be paused.
     */
    modifier whenPaused() {
        _requirePaused();
        _;
    }

    /**
     * @dev Returns true if the contract is paused, and false otherwise.
     */
    function paused() public view virtual returns (bool) {
        return _paused;
    }

    /**
     * @dev Throws if the contract is paused.
     */
    function _requireNotPaused() internal view virtual {
        require(!paused(), "Pausable: paused");
    }

    /**
     * @dev Throws if the contract is not paused.
     */
    function _requirePaused() internal view virtual {
        require(paused(), "Pausable: not paused");
    }

    /**
     * @dev Triggers stopped state.
     *
     * Requirements:
     *
     * - The contract must not be paused.
     */
    function _pause() internal virtual whenNotPaused {
        _paused = true;
        emit Paused(_msgSender());
    }

    /**
     * @dev Returns to normal state.
     *
     * Requirements:
     *
     * - The contract must be paused.
     */
    function _unpause() internal virtual whenPaused {
        _paused = false;
        emit Unpaused(_msgSender());
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[49] private __gap;
}

// File: contracts/modules/internal/EnforcementModuleInternal.sol



pragma solidity ^0.8.17;



/**
 * @dev Enforcement module.
 *
 * Allows the issuer to freeze transfers from a given address
 */
abstract contract EnforcementModuleInternal is
    Initializable,
    ContextUpgradeable
{
    /**
     * @notice Emitted when an address is frozen.
     */
    event Freeze(address indexed enforcer, address indexed owner, string indexed reasonIndexed, string reason);

    /**
     * @notice Emitted when an address is unfrozen.
     */
    event Unfreeze(address indexed enforcer, address indexed owner, string indexed reasonIndexed, string reason);

    mapping(address => bool) private _frozen;

    /**
     * @dev Initializes the contract
     */
    function __Enforcement_init() internal onlyInitializing {
        __Context_init_unchained();
        __Enforcement_init_unchained();
    }

    function __Enforcement_init_unchained() internal onlyInitializing {
        // no variable to initialize
    }

    /**
     * @dev Returns true if the account is frozen, and false otherwise.
     */
    function frozen(address account) public view virtual returns (bool) {
        return _frozen[account];
    }

    /**
     * @dev Freezes an address.
     * @param account the account to freeze
     * @param reason indicate why the account was frozen.
     *
     */
    function _freeze(address account, string memory reason) internal virtual returns (bool) {
        if (_frozen[account]) return false;
        _frozen[account] = true;
        emit Freeze(_msgSender(), account, reason, reason);
        return true;
    }

    /**
     * @dev Unfreezes an address.
     * @param account the account to unfreeze
     * @param reason indicate why the account was unfrozen.
     */
    function _unfreeze(address account, string memory reason) internal virtual returns (bool) {
        if (!_frozen[account]) return false;
        _frozen[account] = false;
        emit Unfreeze(_msgSender(), account, reason, reason);

        return true;
    }

    uint256[50] private __gap;
}

// File: contracts/modules/wrapper/mandatory/EnforcementModule.sol



pragma solidity ^0.8.17;




/**
 * @dev Enforcement module.
 *
 * Allows the issuer to freeze transfers from a given address
 */
abstract contract EnforcementModule is EnforcementModuleInternal,
    AuthorizationModule {

    bytes32 public constant ENFORCER_ROLE = keccak256("ENFORCER_ROLE");
    string internal constant TEXT_TRANSFER_REJECTED_FROZEN =
        "The address is frozen";

    function __EnforcementModule_init() internal onlyInitializing {
        /* OpenZeppelin */
        __Context_init_unchained();
        // AccessControlUpgradeable inherits from ERC165Upgradeable
        __ERC165_init_unchained();
        // AuthorizationModule inherits from AccessControlUpgradeable
        __AccessControl_init_unchained();

        /* Internal */
        __Enforcement_init_unchained();

        /* Wrapper */
        __AuthorizationModule_init_unchained();

        /* own function */
        __EnforcementModule_init_unchained();
    }

    function __EnforcementModule_init_unchained() internal onlyInitializing {
        // no variable to initialize
    }

    /**
     * @notice Freezes an address.
     * @param account the account to freeze
     * @param reason indicate why the account was frozen.
     */
    function freeze(address account, string memory reason)
        public
        onlyRole(ENFORCER_ROLE)
        returns (bool)
    {
        return _freeze(account, reason);
    }

    /**
     * @notice Unfreezes an address.
     * @param account the account to unfreeze
     * @param reason indicate why the account was unfrozen.
     *
     *
     */
    function unfreeze(address account, string memory reason)
        public
        onlyRole(ENFORCER_ROLE)
        returns (bool)
    {
        return _unfreeze(account, reason);
    }

    uint256[50] private __gap;
}

// File: contracts/modules/wrapper/mandatory/ERC20BaseModule.sol



pragma solidity ^0.8.17;

// required OZ imports here


abstract contract ERC20BaseModule is ERC20Upgradeable {
    /* Events */
    event Spend(address indexed owner, address indexed spender, uint256 amount);

    /* Variables */
    uint8 private _decimals;

    /* Initializers */
    /**
     * @dev Sets the values for {name} and {symbol}.
     *
     * All two of these values are immutable: they can only be set once during
     * construction.
     */
    function __ERC20Module_init(
        string memory name_,
        string memory symbol_,
        uint8 decimals_
    ) internal onlyInitializing {
         /* OpenZeppelin */
        __Context_init_unchained();
        __ERC20_init(name_, symbol_);

        /* own function */
        __ERC20Module_init_unchained(decimals_);
    }

    function __ERC20Module_init_unchained(
        uint8 decimals_
    ) internal onlyInitializing {
        _decimals = decimals_;
    }

    /* Methods */
    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5,05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei. This is the value {ERC20} uses, unless this function is
     * overridden;
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view virtual override returns (uint8) {
        return _decimals;
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {ERC20}.
     *
     * Requirements:
     *
     * - `sender` and `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     * - the caller must have allowance for ``sender``'s tokens of at least
     * `amount`.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public virtual override returns (bool) {
        bool result = super.transferFrom(sender, recipient, amount);
        if (result == true) {
            emit Spend(sender, _msgSender(), amount);
        }

        return result;
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(
        address spender,
        uint256 amount,
        uint256 currentAllowance
    ) public virtual returns (bool) {
        require(
            allowance(_msgSender(), spender) == currentAllowance,
            "CMTAT: current allowance is not right"
        );
        super.approve(spender, amount);
        return true;
    }

    uint256[50] private __gap;
}

// File: openzeppelin-contracts-upgradeable/contracts/utils/StorageSlotUpgradeable.sol


// OpenZeppelin Contracts (last updated v4.7.0) (utils/StorageSlot.sol)

pragma solidity ^0.8.0;

/**
 * @dev Library for reading and writing primitive types to specific storage slots.
 *
 * Storage slots are often used to avoid storage conflict when dealing with upgradeable contracts.
 * This library helps with reading and writing to such slots without the need for inline assembly.
 *
 * The functions in this library return Slot structs that contain a `value` member that can be used to read or write.
 *
 * Example usage to set ERC1967 implementation slot:
 * ```
 * contract ERC1967 {
 *     bytes32 internal constant _IMPLEMENTATION_SLOT = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;
 *
 *     function _getImplementation() internal view returns (address) {
 *         return StorageSlot.getAddressSlot(_IMPLEMENTATION_SLOT).value;
 *     }
 *
 *     function _setImplementation(address newImplementation) internal {
 *         require(Address.isContract(newImplementation), "ERC1967: new implementation is not a contract");
 *         StorageSlot.getAddressSlot(_IMPLEMENTATION_SLOT).value = newImplementation;
 *     }
 * }
 * ```
 *
 * _Available since v4.1 for `address`, `bool`, `bytes32`, and `uint256`._
 */
library StorageSlotUpgradeable {
    struct AddressSlot {
        address value;
    }

    struct BooleanSlot {
        bool value;
    }

    struct Bytes32Slot {
        bytes32 value;
    }

    struct Uint256Slot {
        uint256 value;
    }

    /**
     * @dev Returns an `AddressSlot` with member `value` located at `slot`.
     */
    function getAddressSlot(bytes32 slot) internal pure returns (AddressSlot storage r) {
        /// @solidity memory-safe-assembly
        assembly {
            r.slot := slot
        }
    }

    /**
     * @dev Returns an `BooleanSlot` with member `value` located at `slot`.
     */
    function getBooleanSlot(bytes32 slot) internal pure returns (BooleanSlot storage r) {
        /// @solidity memory-safe-assembly
        assembly {
            r.slot := slot
        }
    }

    /**
     * @dev Returns an `Bytes32Slot` with member `value` located at `slot`.
     */
    function getBytes32Slot(bytes32 slot) internal pure returns (Bytes32Slot storage r) {
        /// @solidity memory-safe-assembly
        assembly {
            r.slot := slot
        }
    }

    /**
     * @dev Returns an `Uint256Slot` with member `value` located at `slot`.
     */
    function getUint256Slot(bytes32 slot) internal pure returns (Uint256Slot storage r) {
        /// @solidity memory-safe-assembly
        assembly {
            r.slot := slot
        }
    }
}

// File: openzeppelin-contracts-upgradeable/contracts/utils/ArraysUpgradeable.sol


// OpenZeppelin Contracts v4.4.1 (utils/Arrays.sol)

pragma solidity ^0.8.0;


/**
 * @dev Collection of functions related to array types.
 */
library ArraysUpgradeable {
    using StorageSlotUpgradeable for bytes32;

    /**
     * @dev Searches a sorted `array` and returns the first index that contains
     * a value greater or equal to `element`. If no such index exists (i.e. all
     * values in the array are strictly less than `element`), the array length is
     * returned. Time complexity O(log n).
     *
     * `array` is expected to be sorted in ascending order, and to contain no
     * repeated elements.
     */
    function findUpperBound(uint256[] storage array, uint256 element) internal view returns (uint256) {
        if (array.length == 0) {
            return 0;
        }

        uint256 low = 0;
        uint256 high = array.length;

        while (low < high) {
            uint256 mid = MathUpgradeable.average(low, high);

            // Note that mid will always be strictly less than high (i.e. it will be a valid array index)
            // because Math.average rounds down (it does integer division with truncation).
            if (unsafeAccess(array, mid).value > element) {
                high = mid;
            } else {
                low = mid + 1;
            }
        }

        // At this point `low` is the exclusive upper bound. We will return the inclusive upper bound.
        if (low > 0 && unsafeAccess(array, low - 1).value == element) {
            return low - 1;
        } else {
            return low;
        }
    }

    /**
     * @dev Access an array in an "unsafe" way. Skips solidity "index-out-of-range" check.
     *
     * WARNING: Only use if you are certain `pos` is lower than the array length.
     */
    function unsafeAccess(address[] storage arr, uint256 pos) internal pure returns (StorageSlotUpgradeable.AddressSlot storage) {
        bytes32 slot;
        // We use assembly to calculate the storage slot of the element at index `pos` of the dynamic array `arr`
        // following https://docs.soliditylang.org/en/v0.8.17/internals/layout_in_storage.html#mappings-and-dynamic-arrays.

        /// @solidity memory-safe-assembly
        assembly {
            mstore(0, arr.slot)
            slot := add(keccak256(0, 0x20), pos)
        }
        return slot.getAddressSlot();
    }

    /**
     * @dev Access an array in an "unsafe" way. Skips solidity "index-out-of-range" check.
     *
     * WARNING: Only use if you are certain `pos` is lower than the array length.
     */
    function unsafeAccess(bytes32[] storage arr, uint256 pos) internal pure returns (StorageSlotUpgradeable.Bytes32Slot storage) {
        bytes32 slot;
        // We use assembly to calculate the storage slot of the element at index `pos` of the dynamic array `arr`
        // following https://docs.soliditylang.org/en/v0.8.17/internals/layout_in_storage.html#mappings-and-dynamic-arrays.

        /// @solidity memory-safe-assembly
        assembly {
            mstore(0, arr.slot)
            slot := add(keccak256(0, 0x20), pos)
        }
        return slot.getBytes32Slot();
    }

    /**
     * @dev Access an array in an "unsafe" way. Skips solidity "index-out-of-range" check.
     *
     * WARNING: Only use if you are certain `pos` is lower than the array length.
     */
    function unsafeAccess(uint256[] storage arr, uint256 pos) internal pure returns (StorageSlotUpgradeable.Uint256Slot storage) {
        bytes32 slot;
        // We use assembly to calculate the storage slot of the element at index `pos` of the dynamic array `arr`
        // following https://docs.soliditylang.org/en/v0.8.17/internals/layout_in_storage.html#mappings-and-dynamic-arrays.

        /// @solidity memory-safe-assembly
        assembly {
            mstore(0, arr.slot)
            slot := add(keccak256(0, 0x20), pos)
        }
        return slot.getUint256Slot();
    }
}

// File: contracts/modules/internal/SnapshotModuleInternal.sol



pragma solidity ^0.8.17;




/**
 * @dev Snapshot module.
 *
 * Useful to take a snapshot of token holder balance and total supply at a specific time
 * Inspired by Openzeppelin - ERC20Snapshot but use the time as Id instead of a counter.
 * Contrary to OpenZeppelin, the function _getCurrentSnapshotId is not available
   because overriding this function can break the contract.
 */

abstract contract SnapshotModuleInternal is
    ERC20Upgradeable
{
    using ArraysUpgradeable for uint256[];

    /**
    @notice Emitted when the snapshot with the specified oldTime was scheduled or rescheduled at the specified newTime.
    */
    event SnapshotSchedule(uint256 indexed oldTime, uint256 indexed newTime);

    /**
    @notice Emitted when the scheduled snapshot with the specified time was cancelled.
    */
    event SnapshotUnschedule(uint256 indexed time);

    /**
    @dev See {OpenZeppelin - ERC20Snapshot}
    Snapshotted values have arrays of ids (time) and the value corresponding to that id.
    ids is expected to be sorted in ascending order, and to contain no repeated elements
    because we use findUpperBound in the function _valueAt
    */
    struct Snapshots {
        uint256[] ids;
        uint256[] values;
    }

    /**
    @dev See {OpenZeppelin - ERC20Snapshot}
    */
    mapping(address => Snapshots) private _accountBalanceSnapshots;
    Snapshots private _totalSupplySnapshots;

    /**
    @dev time instead of a counter for OpenZeppelin
    */
    uint256 private _currentSnapshotTime;
    uint256 private _currentSnapshotIndex;

    /**
    @dev
    list of scheduled snapshot (time)
    This list is sorted in ascending order
    */
    uint256[] private _scheduledSnapshots;

    /**
     * @dev Initializes the contract
     */
    function __Snapshot_init(string memory name_, string memory symbol_) internal onlyInitializing {
        __Context_init_unchained();
        __ERC20_init(name_, symbol_);
        __Snapshot_init_unchained();
    }

    function __Snapshot_init_unchained() internal onlyInitializing{
        _currentSnapshotTime = 0;
        _currentSnapshotIndex = 0;
    }

    /**
    @dev schedule a snapshot at the specified time
    You can only add a snapshot after the last previous
    */
    function _scheduleSnapshot(uint256 time) internal {
        // Check the time firstly to avoid an useless read of storage
        require(time > block.timestamp, "Snapshot scheduled in the past");

        if(_scheduledSnapshots.length > 0) {
            // We check the last snapshot on the list
            require(time > _scheduledSnapshots[_scheduledSnapshots.length -1], "time has to be greater than the last snapshot time");
        }
        _scheduledSnapshots.push(time);
        emit SnapshotSchedule(0, time);
    }

    /**
    @dev schedule a snapshot at the specified time
    */
    function _scheduleSnapshotNotOptimized(uint256 time) internal {
        require(time > block.timestamp, "Snapshot scheduled in the past");
        (bool isFound, uint256 index) = _findScheduledSnapshotIndex(time);
        // Perfect match
        require(!isFound, "Snapshot already exists");
        // if no upper bound match found, we push the snapshot at the end of the list
        if(index == _scheduledSnapshots.length) {
             _scheduledSnapshots.push(time);
        }else{
            _scheduledSnapshots.push(_scheduledSnapshots[_scheduledSnapshots.length - 1]);
            for(uint256 i = _scheduledSnapshots.length - 2; i > index;) {
            _scheduledSnapshots[i] = _scheduledSnapshots[i - 1];
                unchecked {--i;}
            }
            _scheduledSnapshots[index] = time;
        }
        emit SnapshotSchedule(0, time);
    }

    /**
    @dev reschedule a scheduled snapshot at the specified newTime
    */
    function _rescheduleSnapshot(uint256 oldTime, uint256 newTime)
        internal
    {
        // Check the time firstly to avoid an useless read of storage
        require(oldTime > block.timestamp, "Snapshot already done");
        require(newTime > block.timestamp, "Snapshot scheduled in the past");
        require(_scheduledSnapshots.length > 0, "no scheduled snapshot");

        (bool foundOld, uint256 index) = _findScheduledSnapshotIndex(oldTime);
        require(foundOld, "Snapshot not found");

        if(index + 1 <  _scheduledSnapshots.length) {
            require(newTime < _scheduledSnapshots[index + 1], "time has to be less than the next snapshot");
        }

        if(index > 0) {
            require(newTime > _scheduledSnapshots[index - 1], "time has to be greater than the previous snapshot");
        }

        _scheduledSnapshots[index] = newTime;

        emit SnapshotSchedule(oldTime, newTime);
    }

    /**
    @dev unschedule the last scheduled snapshot
    */
    function _unscheduleLastSnapshot(uint256 time) internal {
        // Check the time firstly to avoid an useless read of storage
        require(time > block.timestamp, "Snapshot already done");
        require(_scheduledSnapshots.length > 0, "No snapshot scheduled");
        // All snapshot time are unique, so we do not check the indice
        require(time == _scheduledSnapshots[ _scheduledSnapshots.length - 1],
        "Only the last snapshot can be unscheduled");
        _scheduledSnapshots.pop();
        emit SnapshotUnschedule(time);
    }

    /**
    @dev unschedule (remove) a scheduled snapshot in three steps:
    - search the snapshot in the list
    - If found, move all next snapshots one position to the left
    - Reduce the array size by deleting the last snapshot
    */
    function _unscheduleSnapshotNotOptimized(uint256 time) internal {
        require(time > block.timestamp, "Snapshot already done");
        (bool isFound, uint256 index) = _findScheduledSnapshotIndex(time);
        require(isFound, "Snapshot not found");
        for(uint256 i = index; i + 1 < _scheduledSnapshots.length;){
            _scheduledSnapshots[i] = _scheduledSnapshots[i + 1];
             unchecked {++i;}
        }
        _scheduledSnapshots.pop();
    }

    /**
    @dev
    Get the next scheduled snapshots
    */
    function getNextSnapshots() public view returns (uint256[] memory) {
        uint256[] memory nextScheduledSnapshot = new uint256[](0);
        // no snapshot were planned
        if(_scheduledSnapshots.length > 0){
            (uint256 timeLowerBound, uint256 indexLowerBound) = _findScheduledMostRecentPastSnapshot();
            // All snapshots are situated in the futur
            if((timeLowerBound == 0) && (_currentSnapshotTime == 0)){
                return _scheduledSnapshots;
            } else{
            // There are snapshots situated in the futur
                if(indexLowerBound + 1 != _scheduledSnapshots.length){
                    // All next snapshots are located after the snapshot specified by indexLowerBound
                    uint256 arraySize = _scheduledSnapshots.length - indexLowerBound - 1;
                    nextScheduledSnapshot = new uint256[](arraySize);
                    for(uint256 i = 0; i < nextScheduledSnapshot.length; ++i){
                        nextScheduledSnapshot[i] = _scheduledSnapshots[indexLowerBound + 1 + i];
                    }
                }
            }
        }
        return nextScheduledSnapshot;
    }

    /**
    @dev
    Get all snapshots
    */
    function getAllSnapshots() public view returns (uint256[] memory) {
        return _scheduledSnapshots;
    }


    /**
    @notice Return the number of tokens owned by the given owner at the time when the snapshot with the given time was created.
    @return value stored in the snapshot, or the actual balance if no snapshot
    */
    function snapshotBalanceOf(uint256 time, address owner)
        public
        view
        returns (uint256)
    {
        (bool snapshotted, uint256 value) = _valueAt(
            time,
            _accountBalanceSnapshots[owner]
        );

        return snapshotted ? value : balanceOf(owner);
    }

    /**
    @dev See {OpenZeppelin - ERC20Snapshot}
    Retrieves the total supply at the specified time.
    @return value stored in the snapshot, or the actual totalSupply if no snapshot
    */
    function snapshotTotalSupply(uint256 time) public view returns (uint256) {
        (bool snapshotted, uint256 value) = _valueAt(
            time,
            _totalSupplySnapshots
        );
        return snapshotted ? value : totalSupply();
    }

    /**
    @dev Update balance and/or total supply snapshots before the values are modified. This is implemented
    in the _beforeTokenTransfer hook, which is executed for _mint, _burn, and _transfer operations.
    */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual override {
        super._beforeTokenTransfer(from, to, amount);

        _setCurrentSnapshot();
        if (from != address(0)) {
            // for both burn and transfer
            _updateAccountSnapshot(from);
            if (to != address(0)) {
                // transfer
                _updateAccountSnapshot(to);
            } else {
                // burn
                _updateTotalSupplySnapshot();
            }
        } else {
            // mint
            _updateAccountSnapshot(to);
            _updateTotalSupplySnapshot();
        }
    }

    /**
    @dev See {OpenZeppelin - ERC20Snapshot}
    @param time where we want a snapshot
    @param snapshots the struct where are stored the snapshots
    @return  snapshotExist true if a snapshot is found, false otherwise
    value 0 if no snapshot, balance value if a snapshot exists
    */
    function _valueAt(uint256 time, Snapshots storage snapshots)
        private
        view
        returns (bool snapshotExist, uint256 value)
    {
        // When a valid snapshot is queried, there are three possibilities:
        //  a) The queried value was not modified after the snapshot was taken. Therefore, a snapshot entry was never
        //  created for this id, and all stored snapshot ids are smaller than the requested one. The value that corresponds
        //  to this id is the current one.
        //  b) The queried value was modified after the snapshot was taken. Therefore, there will be an entry with the
        //  requested id, and its value is the one to return.
        //  c) More snapshots were created after the requested one, and the queried value was later modified. There will be
        //  no entry for the requested id: the value that corresponds to it is that of the smallest snapshot id that is
        //  larger than the requested one.
        //
        // In summary, we need to find an element in an array, returning the index of the smallest value that is larger if
        // it is not found, unless said value doesn't exist (e.g. when all values are smaller). Arrays.findUpperBound does
        // exactly this.

        uint256 index = snapshots.ids.findUpperBound(time);

        if (index == snapshots.ids.length) {
            return (false, 0);
        } else {
            return (true, snapshots.values[index]);
        }
    }

    /**
    @dev See {OpenZeppelin - ERC20Snapshot}
    */
    function _updateAccountSnapshot(address account) private {
        _updateSnapshot(_accountBalanceSnapshots[account], balanceOf(account));
    }

    /**
    @dev See {OpenZeppelin - ERC20Snapshot}
    */
    function _updateTotalSupplySnapshot() private {
        _updateSnapshot(_totalSupplySnapshots, totalSupply());
    }

    /**
    @dev
    Inside a struct Snapshots:
    - Update the array ids to the current Snapshot time if this one is greater than the snapshot times stored in ids.
    - Update the value to the corresponding value.
    */
    function _updateSnapshot(Snapshots storage snapshots, uint256 currentValue)
        private
    {
        uint256 current = _currentSnapshotTime;
        if (_lastSnapshot(snapshots.ids) < current) {
            snapshots.ids.push(current);
            snapshots.values.push(currentValue);
        }
    }

    /**
    @dev
    Set the currentSnapshotTime by retrieving the most recent snapshot
    if a snapshot exists, clear all past scheduled snapshot
    */
    function _setCurrentSnapshot() internal {
        (uint256 scheduleSnapshotTime, uint256 scheduleSnapshotIndex) = _findScheduledMostRecentPastSnapshot();
        if (scheduleSnapshotTime > 0) {
            _currentSnapshotTime = scheduleSnapshotTime;
            _currentSnapshotIndex = scheduleSnapshotIndex;
        }
    }

    /**
    @return the last snapshot time inside a snapshot ids array
    */
    function _lastSnapshot(uint256[] storage ids)
        private
        view
        returns (uint256)
    {
        if (ids.length == 0) {
            return 0;
        } else {
            return ids[ids.length - 1];
        }
    }

    /**
    @dev Find the snapshot index at the specified time
    @return (true, index) if the snapshot exists, (false, 0) otherwise
    */
    function _findScheduledSnapshotIndex(uint256 time)
        private
        view
        returns (bool, uint256)
    {
         uint256 indexFound =_scheduledSnapshots.findUpperBound(time);
         // Exact match
         if(indexFound != _scheduledSnapshots.length &&
         _scheduledSnapshots[indexFound] == time ){
            return (true, indexFound);
         } // Upper bound match
         else if(indexFound != _scheduledSnapshots.length){
             return (false, indexFound);
         } // no match
         else{
             return (false, _scheduledSnapshots.length);
         }
    }

    /**
    @dev find the most recent past snapshot
    The complexity of this function is O(N) because we go through the whole list
    */
    function _findScheduledMostRecentPastSnapshot()
        private
        view
        returns (uint256 time, uint256 index)
    {
        uint256 currentArraySize =  _scheduledSnapshots.length;
        // no snapshot or the current snapshot already points on the last snapshot
        if (currentArraySize == 0 ||
            ((_currentSnapshotIndex + 1 == currentArraySize)
            && (time != 0))){
            return (0, currentArraySize);
        }
        uint256 mostRecent = 0;
        index = currentArraySize;
        for (uint256 i = _currentSnapshotIndex; i < currentArraySize; ++i) {
            if (
                _scheduledSnapshots[i] <= block.timestamp
            ) {

                mostRecent = _scheduledSnapshots[i];
                index = i;
            }else {
                // All snapshot are planned in the futur
                break;
            }
        }
        return (mostRecent, index);
    }

    uint256[50] private __gap;
}

// File: contracts/modules/wrapper/mandatory/SnapshotModule.sol



pragma solidity ^0.8.17;



/**
 * @dev Snapshot module.
 *
 * Useful to take a snapshot of token holder balance and total supply at a specific time
 */
abstract contract SnapshotModule is SnapshotModuleInternal, AuthorizationModule {
    bytes32 public constant SNAPSHOOTER_ROLE = keccak256("SNAPSHOOTER_ROLE");

    function __SnasphotModule_init(string memory name_, string memory symbol_) internal onlyInitializing {
        /* OpenZeppelin */
        __Context_init_unchained();
        // SnapshotModuelInternal inherits from ERC20
        __ERC20_init_unchained(name_, symbol_);
        // AccessControlUpgradeable inherits from ERC165Upgradeable
        __ERC165_init_unchained();
        // AuthorizationModule inherits from AccessControlUpgradeable
        __AccessControl_init_unchained();

        /* Internal */
        __Snapshot_init_unchained();

        /* Wrapper */
        __AuthorizationModule_init_unchained();

        /* own function */
        __SnasphotModule_init_unchained();

    }

    function __SnasphotModule_init_unchained() internal onlyInitializing {
        // no variable to initialize
    }

    /*
    @notice
    Schedule a snapshot at the given time specified as a number of seconds since epoch.
    The time cannot be before the time of the latest scheduled, but not yet created snapshot.
    */
    function scheduleSnapshot(uint256 time)
        public
        onlyRole(SNAPSHOOTER_ROLE)
    {
        _scheduleSnapshot(time);
    }

    /*
    @notice
    Schedule a snapshot at the given time specified as a number of seconds since epoch.
    The time cannot be before the time of the latest scheduled, but not yet created snapshot.
    */
    function scheduleSnapshotNotOptimized(uint256 time)
        public
        onlyRole(SNAPSHOOTER_ROLE)
    {
        _scheduleSnapshotNotOptimized(time);
    }

    /*
    @notice
    Reschedule the scheduled snapshot, but not yet created snapshot with the given oldTime to be created at the given newTime specified as a number of seconds since epoch.
    The newTime cannot be before the time of the previous scheduled, but not yet created snapshot, or after the time fo the next scheduled snapshot.
    */
    function rescheduleSnapshot(uint256 oldTime, uint256 newTime)
        public
        onlyRole(SNAPSHOOTER_ROLE)
    {
        _rescheduleSnapshot(oldTime, newTime);
    }

    /*
    @notice
    Cancel creation of the scheduled snapshot, but not yet created snapshot with the given time.
    There should not be any other snapshots scheduled after this one.
    */
    function unscheduleLastSnapshot(uint256 time)
        public
        onlyRole(SNAPSHOOTER_ROLE)
    {
        _unscheduleLastSnapshot(time);
    }

    /*
    @notice
    Cancel creation of the scheduled snapshot, but not yet created snapshot with the given time.

    */
    function unscheduleSnapshotNotOptimized(uint256 time)
        public
        onlyRole(SNAPSHOOTER_ROLE)
    {
        _unscheduleSnapshotNotOptimized(time);
    }



    uint256[50] private __gap;
}

// File: contracts/modules/wrapper/mandatory/PauseModule.sol



pragma solidity ^0.8.17;



/**
 * @dev ERC20 token with pausable token transfers, minting and burning.
 *
 * Useful for scenarios such as preventing trades until the end of an evaluation
 * period, or having an emergency switch for freezing all token transfers in the
 * event of a large bug.
 */
abstract contract PauseModule is PausableUpgradeable, AuthorizationModule {
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
    string internal constant TEXT_TRANSFER_REJECTED_PAUSED =
        "All transfers paused";

    function __PauseModule_init() internal onlyInitializing {
        /* OpenZeppelin */
        __Context_init_unchained();
        __Pausable_init_unchained();
        // AccessControlUpgradeable inherits from ERC165Upgradeable
        __ERC165_init_unchained();
        // AuthorizationModule inherits from AccessControlUpgradeable
        __AccessControl_init_unchained();

        /* Wrapper */
        __AuthorizationModule_init_unchained();

        /* own function */
        __PauseModule_init_unchained();
    }

    function __PauseModule_init_unchained() internal onlyInitializing {
        // no variable to initialize
    }

    /**
     * @dev Pauses all token transfers.
     *
     * See {ERC20Pausable} and {Pausable-_pause}.
     *
     * Requirements:
     *
     * - the caller must have the `PAUSER_ROLE`.
     */
    function pause() public onlyRole(PAUSER_ROLE) {
        _pause();
    }

    /**
     * @dev Unpauses all token transfers.
     *
     * See {ERC20Pausable} and {Pausable-_unpause}.
     *
     * Requirements:
     *
     * - the caller must have the `PAUSER_ROLE`.
     */
    function unpause() public onlyRole(PAUSER_ROLE) {
        _unpause();
    }

    uint256[50] private __gap;
}

// File: contracts/interfaces/IERC1404.sol



pragma solidity ^0.8.17;


interface IERC1404 {
    /**
     * @dev See ERC-1404
     *
     */
    function detectTransferRestriction(
        address _from,
        address _to,
        uint256 _amount
    ) external view returns (uint8);

    /**
     * @dev See ERC-1404
     *
     */
    function messageForTransferRestriction(uint8 _restrictionCode)
        external
        view
        returns (string memory);
}

// File: contracts/interfaces/IERC1404Wrapper.sol



pragma solidity ^0.8.17;

interface IERC1404Wrapper is IERC1404 {
    /**
     * @dev Returns true if the transfer is valid, and false otherwise.
     */
    function validateTransfer(
        address _from,
        address _to,
        uint256 _amount
    ) external view returns (bool isValid);
}

// File: contracts/interfaces/IRule.sol



pragma solidity ^0.8.17;

interface IRule is IERC1404Wrapper {
     /**
     * @dev Returns true if the restriction code exists, and false otherwise.
     */
     function canReturnTransferRestrictionCode(uint8 _restrictionCode)
        external
        view
        returns (bool);
}

// File: contracts/interfaces/IRuleEngine.sol



pragma solidity ^0.8.17;


interface IRuleEngine is IERC1404Wrapper{
    /**
    * @dev define the rules, the precedent rules will be overwritten
    */
    function setRules(IRule[] calldata rules_) external;

    /**
    * @dev return the number of rules
    */
    function ruleLength() external view returns (uint256);

    /**
    * @dev return the rule at the index specified by ruleId
    */
    function rule(uint256 ruleId) external view returns (IRule);

    /**
    * @dev return all the rules
    */
    function rules() external view returns (IRule[] memory);
}

// File: contracts/modules/internal/ValidationModuleInternal.sol



pragma solidity ^0.8.17;



/**
 * @dev Validation module.
 *
 * Useful for to restrict and validate transfers
 */
abstract contract ValidationModuleInternal is Initializable, ContextUpgradeable {
    /**
     * @dev Emitted when a rule engine is set.
     */
    event RuleEngineSet(address indexed newRuleEngine);

    IRuleEngine public ruleEngine;

    /**
     * @dev Initializes the contract with rule engine.
     */
    function __Validation_init(IRuleEngine ruleEngine_) internal onlyInitializing {
        __Context_init_unchained();
        __Validation_init_unchained(ruleEngine_);
    }

    function __Validation_init_unchained(IRuleEngine ruleEngine_)
        internal
        onlyInitializing
    {
        if (address(ruleEngine_) != address(0)) {
            ruleEngine = ruleEngine_;
            emit RuleEngineSet(address(ruleEngine));
        }
    }

    function _validateTransfer(
        address from,
        address to,
        uint256 amount
    ) internal view returns (bool) {
        return ruleEngine.validateTransfer(from, to, amount);
    }

    function _messageForTransferRestriction(uint8 restrictionCode)
        internal
        view
        returns (string memory)
    {
        return ruleEngine.messageForTransferRestriction(restrictionCode);
    }

    function _detectTransferRestriction(
        address from,
        address to,
        uint256 amount
    ) internal view returns (uint8) {
        return ruleEngine.detectTransferRestriction(from, to, amount);
    }

    uint256[50] private __gap;
}

// File: contracts/modules/wrapper/optional/ValidationModule.sol



pragma solidity ^0.8.17;





/**
 * @dev Validation module.
 *
 * Useful for to restrict and validate transfers
 */
abstract contract ValidationModule is ValidationModuleInternal, PauseModule, EnforcementModule, IERC1404Wrapper {
    enum REJECTED_CODE { TRANSFER_OK, TRANSFER_REJECTED_PAUSED, TRANSFER_REJECTED_FROZEN }
    string constant TEXT_TRANSFER_OK = "No restriction";

    function __ValidationModule_init(IRuleEngine ruleEngine_) internal onlyInitializing {
        /* OpenZeppelin */
        __Context_init_unchained();
        // AccessControlUpgradeable inherits from ERC165Upgradeable
        __ERC165_init_unchained();
        __AccessControl_init_unchained();
        __Pausable_init_unchained();

        /* Internal */
        __Validation_init_unchained(ruleEngine_);

        /* Wrapper */
        __AuthorizationModule_init_unchained();
        __PauseModule_init_unchained();
        __EnforcementModule_init_unchained();

        /* own function */
        __ValidationModule_init_unchained();
    }

    function __ValidationModule_init_unchained() internal onlyInitializing {
        // no variable to initialize
    }

    function setRuleEngine(IRuleEngine ruleEngine_)
        external
        onlyRole(DEFAULT_ADMIN_ROLE)
    {
        ruleEngine = ruleEngine_;
        emit RuleEngineSet(address(ruleEngine_));
    }

    /**
     * @dev ERC1404 check if _value token can be transferred from _from to _to
     * @param from address The address which you want to send tokens from
     * @param to address The address which you want to transfer to
     * @param amount uint256 the amount of tokens to be transferred
     * @return code of the rejection reason
     */
    function detectTransferRestriction(
        address from,
        address to,
        uint256 amount
    ) public view override returns (uint8 code) {
        if (paused()) {
            return uint8(REJECTED_CODE.TRANSFER_REJECTED_PAUSED);
        } else if (frozen(from)) {
            return uint8(REJECTED_CODE.TRANSFER_REJECTED_FROZEN);
        } else if (address(ruleEngine) != address(0)) {
            return _detectTransferRestriction(from, to, amount);
        }
        return uint8(REJECTED_CODE.TRANSFER_OK);
    }

    /**
     * @dev ERC1404 returns the human readable explaination corresponding to the error code returned by detectTransferRestriction
     * @param restrictionCode The error code returned by detectTransferRestriction
     * @return message The human readable explaination corresponding to the error code returned by detectTransferRestriction
     */
    function messageForTransferRestriction(uint8 restrictionCode)
        external
        view
        override
        returns (string memory message)
    {
        if (restrictionCode == uint8(REJECTED_CODE.TRANSFER_OK)) {
            return TEXT_TRANSFER_OK;
        } else if (restrictionCode == uint8(REJECTED_CODE.TRANSFER_REJECTED_PAUSED)) {
            return TEXT_TRANSFER_REJECTED_PAUSED;
        } else if (restrictionCode == uint8(REJECTED_CODE.TRANSFER_REJECTED_FROZEN)) {
            return TEXT_TRANSFER_REJECTED_FROZEN;
        } else if (address(ruleEngine) != address(0)) {
            return _messageForTransferRestriction(restrictionCode);
        }
    }

    function validateTransfer(
        address from,
        address to,
        uint256 amount
    ) public view override returns (bool) {
         if (address(ruleEngine) != address(0)) {
            return _validateTransfer(from, to, amount);
        }
        return true;
    }

    uint256[50] private __gap;
}

// File: openzeppelin-contracts-upgradeable/contracts/metatx/ERC2771ContextUpgradeable.sol


// OpenZeppelin Contracts (last updated v4.7.0) (metatx/ERC2771Context.sol)

pragma solidity ^0.8.9;


/**
 * @dev Context variant with ERC2771 support.
 */
abstract contract ERC2771ContextUpgradeable is Initializable, ContextUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow state-variable-immutable
    address private immutable _trustedForwarder;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor(address trustedForwarder) {
        _trustedForwarder = trustedForwarder;
    }

    function isTrustedForwarder(address forwarder) public view virtual returns (bool) {
        return forwarder == _trustedForwarder;
    }

    function _msgSender() internal view virtual override returns (address sender) {
        if (isTrustedForwarder(msg.sender)) {
            // The assembly code is more direct than the Solidity version using `abi.decode`.
            /// @solidity memory-safe-assembly
            assembly {
                sender := shr(96, calldataload(sub(calldatasize(), 20)))
            }
        } else {
            return super._msgSender();
        }
    }

    function _msgData() internal view virtual override returns (bytes calldata) {
        if (isTrustedForwarder(msg.sender)) {
            return msg.data[:msg.data.length - 20];
        } else {
            return super._msgData();
        }
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}

// File: contracts/modules/wrapper/optional/MetaTxModule.sol



pragma solidity ^0.8.17;


/**
 * @dev Meta transaction (gasless) module.
 *
 * Useful for to provide UX where the user does not pay gas for token exchange
 * To follow OpenZeppelin, this contract does not implement the functions init & init_unchained.
 * ()
 */
abstract contract MetaTxModule is ERC2771ContextUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor(address trustedForwarder)
        ERC2771ContextUpgradeable(trustedForwarder)
    {
        // Nothing to do
    }

    function _msgSender()
        internal
        view
        override
        virtual
        returns (address sender)
    {
        return ERC2771ContextUpgradeable._msgSender();
        // return msg.sender;
    }

    function _msgData()
        internal
        view
        override
        virtual
        returns (bytes calldata)
    {
        return ERC2771ContextUpgradeable._msgData();
    }

    uint256[50] private __gap;
}

// File: contracts/CMTAT.sol

/**
 * @dev Wrappers over Solidity's arithmetic operations.
 *
 * NOTE: `SafeMath` is generally not needed starting with Solidity 0.8, since the compiler
 * now has built in overflow checking.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            uint256 c = a + b;
            if (c < a) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
            // benefit is lost if 'b' is also tested.
            // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
            if (a == 0) return (true, 0);
            uint256 c = a * b;
            if (c / a != b) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a / b);
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a % b);
        }
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator.
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}


pragma solidity ^0.8.17;

// required OZ imports here


contract CMTAT is
    Initializable,
    ContextUpgradeable,
    BaseModule,
    PauseModule,
    MintModule,
    BurnModule,
    EnforcementModule,
    ValidationModule,
    MetaTxModule,
    SnapshotModule,
    ERC20BaseModule
{
    /// @custom:oz-upgrades-unsafe-allow constructor
    uint public totalHolders;
    address public escrow;
    address public vesting;
    address public trustedForwarder;
    using SafeMath for uint;
    constructor(address forwarder, bool deployedWithProxy_, address owner, string memory name, string memory symbol, string memory tokenId, string memory terms
    ) MetaTxModule(forwarder) {
        trustedForwarder = forwarder;

         if(!deployedWithProxy_){
            // Initialize the contract to avoid front-running
            // Warning : do not initialize the proxy
            initialize(deployedWithProxy_, owner, name, symbol,tokenId, terms);
         }else{
            // Initialize the variable for the implementation
            deployedWithProxy = true;
            // Disable the possibility to initialize the implementation
            _disableInitializers();
         }
    }

    function setVesting(address _vesting) public {
        require(hasRole(DEFAULT_ADMIN_ROLE, msg.sender) , "only admin");
        vesting = _vesting;
    }

    function setEscrow(address _escrow) public {
        require(hasRole(DEFAULT_ADMIN_ROLE, msg.sender) , "only admin");
        escrow = _escrow;
    }

    function initialize(
        bool deployedWithProxy_,
        address owner,
        string memory name,
        string memory symbol,
        string memory tokenId,
        string memory terms
    ) public initializer {
        __CMTAT_init(deployedWithProxy_, owner, name, symbol, tokenId, terms);
    }

    /**
     * @dev Grants `DEFAULT_ADMIN_ROLE`, `MINTER_ROLE` and `PAUSER_ROLE` to the
     * account that deploys the contract.
     *
     * See {ERC20-constructor}.
     */
    function __CMTAT_init(
        bool deployedWithProxy_,
        address owner,
        string memory name,
        string memory symbol,
        string memory tokenId,
        string memory terms
    ) internal onlyInitializing {
        /* OpenZeppelin library */
        // OZ init_unchained functions are called firstly due to inheritance
        __Context_init_unchained();
        __ERC20_init_unchained(name, symbol);
        // AccessControlUpgradeable inherits from ERC165Upgradeable
        __ERC165_init_unchained();
        // AuthorizationModule inherits from AccessControlUpgradeable
        __AccessControl_init_unchained();
        __Pausable_init_unchained();

        /* Internal Modules */
        __Enforcement_init_unchained();
        __Snapshot_init_unchained();
        // we set the RuleEngine by calling the setter
        // __Validation_init_unchained(IRuleEngine ruleEngine_)

        /* Wrapper */
        // AuthorizationModule_init_unchained is called firstly due to inheritance
        __AuthorizationModule_init_unchained();
        __BurnModule_init_unchained();
        __MintModule_init_unchained();
        // EnforcementModule_init_unchained is called before ValidationModule_init_unchained due to inheritance
        __EnforcementModule_init_unchained();
        __ERC20Module_init_unchained(0);
        // PauseModule_init_unchained is called before ValidationModule_init_unchained due to inheritance
        __PauseModule_init_unchained();
        __ValidationModule_init_unchained();
        __SnasphotModule_init_unchained();

        /* Other modules */
        __Base_init_unchained(tokenId, terms);

         /* own function */
        __CMTAT_init_unchained(deployedWithProxy_, owner);
    }


    function __CMTAT_init_unchained(bool deployedWithProxy_, address owner) internal onlyInitializing {
        deployedWithProxy = deployedWithProxy_;
        _grantRole(DEFAULT_ADMIN_ROLE, owner);
        _grantRole(ENFORCER_ROLE, owner);
        _grantRole(MINTER_ROLE, owner);
        _grantRole(BURNER_ROLE, owner);
        _grantRole(PAUSER_ROLE, owner);
        _grantRole(SNAPSHOOTER_ROLE, owner);
    }

    function decimals()
        public
        view
        virtual
        override(ERC20Upgradeable, ERC20BaseModule)
        returns (uint8)
    {
        return ERC20BaseModule.decimals();
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public virtual override(ERC20Upgradeable, ERC20BaseModule) returns (bool) {
        return ERC20BaseModule.transferFrom(sender, recipient, amount);
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal override(SnapshotModuleInternal, ERC20Upgradeable) {
        require(!paused(), "CMTAT: token transfer while paused");
        require(!frozen(from), "CMTAT: token transfer while frozen");
        if(balanceOf(to) == 0 && to != escrow && to != vesting){
            totalHolders = totalHolders.add(1);
        }
        if(balanceOf(from) == amount && to != escrow && to != vesting){
            totalHolders = totalHolders.sub(1);
        }
        SnapshotModuleInternal._beforeTokenTransfer(from, to, amount);

        require(validateTransfer(from, to, amount), "CMTAT: transfer rejected by validation module");
    }

    /**
    @dev This surcharge is not necessary if you do not use the MetaTxModule
    */
    function _msgSender()
        internal
        view
        override(MetaTxModule, ContextUpgradeable)
        returns (address sender)
    {
        return MetaTxModule._msgSender();
    }

    /**
    @dev This surcharge is not necessary if you do not use the MetaTxModule
    */
    function _msgData()
        internal
        view
        override(MetaTxModule, ContextUpgradeable)
        returns (bytes calldata)
    {
        return MetaTxModule._msgData();
    }

    uint256[50] private __gap;
}
contract Factory is MetaTxModule{
   CMTAT[] public companies;
   address public admin;
   address public trustedForwarder;

   uint256 public index;

   mapping (address => address) public tokens;

   constructor(address _forwarder) MetaTxModule(_forwarder) {
       admin = payable(_msgSender());
       trustedForwarder = _forwarder;
   }

   function setForwarder(address _newForwarder) external {
       require(_msgSender() == admin, "not allowed ! ");
       trustedForwarder = _newForwarder;
   }

   function setAdmin(address _newAdmin) external {
       require(_msgSender() == admin, "not allowed ! ");
       admin = _newAdmin;
   }

   function CreateCompany(
        address admin,
        string memory nameIrrevocable,
        string memory symbolIrrevocable,
        string memory tokenId_,
        string memory terms_,
        address ruleEngine_,
        string memory information_,
        uint256 flag_
       ) public returns(address){

     CMTAT newCompany = new CMTAT(
        trustedForwarder,
        false,
        admin,
        nameIrrevocable,
        symbolIrrevocable,
        tokenId_,
        terms_
        // ruleEngine_,
        // information_,
        // flag_
         );
     companies.push(newCompany);
     index += 1;
     tokens[admin] = address(newCompany);
     return address(newCompany);
   }

}

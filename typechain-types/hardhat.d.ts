/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */

import { ethers } from "ethers";
import {
  FactoryOptions,
  HardhatEthersHelpers as HardhatEthersHelpersBase,
} from "@nomiclabs/hardhat-ethers/types";

import * as Contracts from ".";

declare module "hardhat/types/runtime" {
  interface HardhatEthersHelpers extends HardhatEthersHelpersBase {
    getContractFactory(
      name: "AccessControlUpgradeable",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.AccessControlUpgradeable__factory>;
    getContractFactory(
      name: "AuthorizationModule",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.AuthorizationModule__factory>;
    getContractFactory(
      name: "BaseModule",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.BaseModule__factory>;
    getContractFactory(
      name: "BurnModule",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.BurnModule__factory>;
    getContractFactory(
      name: "CMTAT",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.CMTAT__factory>;
    getContractFactory(
      name: "ContextUpgradeable",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.ContextUpgradeable__factory>;
    getContractFactory(
      name: "EnforcementModule",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.EnforcementModule__factory>;
    getContractFactory(
      name: "EnforcementModuleInternal",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.EnforcementModuleInternal__factory>;
    getContractFactory(
      name: "ERC165Upgradeable",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.ERC165Upgradeable__factory>;
    getContractFactory(
      name: "ERC20BaseModule",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.ERC20BaseModule__factory>;
    getContractFactory(
      name: "ERC20Upgradeable",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.ERC20Upgradeable__factory>;
    getContractFactory(
      name: "ERC2771ContextUpgradeable",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.ERC2771ContextUpgradeable__factory>;
    getContractFactory(
      name: "Factory",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.Factory__factory>;
    getContractFactory(
      name: "IAccessControlUpgradeable",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.IAccessControlUpgradeable__factory>;
    getContractFactory(
      name: "IERC1404",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.IERC1404__factory>;
    getContractFactory(
      name: "IERC1404Wrapper",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.IERC1404Wrapper__factory>;
    getContractFactory(
      name: "IERC165Upgradeable",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.IERC165Upgradeable__factory>;
    getContractFactory(
      name: "IERC20MetadataUpgradeable",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.IERC20MetadataUpgradeable__factory>;
    getContractFactory(
      name: "IERC20Upgradeable",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.IERC20Upgradeable__factory>;
    getContractFactory(
      name: "Initializable",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.Initializable__factory>;
    getContractFactory(
      name: "IRule",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.IRule__factory>;
    getContractFactory(
      name: "IRuleEngine",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.IRuleEngine__factory>;
    getContractFactory(
      name: "MetaTxModule",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.MetaTxModule__factory>;
    getContractFactory(
      name: "MintModule",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.MintModule__factory>;
    getContractFactory(
      name: "PausableUpgradeable",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.PausableUpgradeable__factory>;
    getContractFactory(
      name: "PauseModule",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.PauseModule__factory>;
    getContractFactory(
      name: "SnapshotModule",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.SnapshotModule__factory>;
    getContractFactory(
      name: "SnapshotModuleInternal",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.SnapshotModuleInternal__factory>;
    getContractFactory(
      name: "ValidationModule",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.ValidationModule__factory>;
    getContractFactory(
      name: "ValidationModuleInternal",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.ValidationModuleInternal__factory>;
    getContractFactory(
      name: "IERC20",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.IERC20__factory>;
    getContractFactory(
      name: "IZklabV1Callee",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.IZklabV1Callee__factory>;
    getContractFactory(
      name: "IZklabV1ERC20",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.IZklabV1ERC20__factory>;
    getContractFactory(
      name: "IZklabV1Factory",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.IZklabV1Factory__factory>;
    getContractFactory(
      name: "IZklabV1Pair",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.IZklabV1Pair__factory>;
    getContractFactory(
      name: "ZklabV1ERC20",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.ZklabV1ERC20__factory>;
    getContractFactory(
      name: "ZklabV1Factory",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.ZklabV1Factory__factory>;
    getContractFactory(
      name: "ZklabV1Pair",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.ZklabV1Pair__factory>;
    getContractFactory(
      name: "IOwnable",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.IOwnable__factory>;
    getContractFactory(
      name: "IOwnable",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.IOwnable__factory>;
    getContractFactory(
      name: "Ownable",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.Ownable__factory>;
    getContractFactory(
      name: "IERC20",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.IERC20__factory>;
    getContractFactory(
      name: "IOwnable",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.IOwnable__factory>;
    getContractFactory(
      name: "Ownable",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.Ownable__factory>;
    getContractFactory(
      name: "PooPreps",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.PooPreps__factory>;
    getContractFactory(
      name: "IArrayV1Factory",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.IArrayV1Factory__factory>;
    getContractFactory(
      name: "IArrayV1Pair",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.IArrayV1Pair__factory>;
    getContractFactory(
      name: "IArrayV1Router01",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.IArrayV1Router01__factory>;
    getContractFactory(
      name: "IArrayV1Router02",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.IArrayV1Router02__factory>;
    getContractFactory(
      name: "IERC20",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.IERC20__factory>;
    getContractFactory(
      name: "IWETH",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.IWETH__factory>;
    getContractFactory(
      name: "Router02",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.Router02__factory>;
    getContractFactory(
      name: "WETH9",
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<Contracts.WETH9__factory>;

    getContractAt(
      name: "AccessControlUpgradeable",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.AccessControlUpgradeable>;
    getContractAt(
      name: "AuthorizationModule",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.AuthorizationModule>;
    getContractAt(
      name: "BaseModule",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.BaseModule>;
    getContractAt(
      name: "BurnModule",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.BurnModule>;
    getContractAt(
      name: "CMTAT",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.CMTAT>;
    getContractAt(
      name: "ContextUpgradeable",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.ContextUpgradeable>;
    getContractAt(
      name: "EnforcementModule",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.EnforcementModule>;
    getContractAt(
      name: "EnforcementModuleInternal",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.EnforcementModuleInternal>;
    getContractAt(
      name: "ERC165Upgradeable",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.ERC165Upgradeable>;
    getContractAt(
      name: "ERC20BaseModule",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.ERC20BaseModule>;
    getContractAt(
      name: "ERC20Upgradeable",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.ERC20Upgradeable>;
    getContractAt(
      name: "ERC2771ContextUpgradeable",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.ERC2771ContextUpgradeable>;
    getContractAt(
      name: "Factory",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.Factory>;
    getContractAt(
      name: "IAccessControlUpgradeable",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.IAccessControlUpgradeable>;
    getContractAt(
      name: "IERC1404",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.IERC1404>;
    getContractAt(
      name: "IERC1404Wrapper",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.IERC1404Wrapper>;
    getContractAt(
      name: "IERC165Upgradeable",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.IERC165Upgradeable>;
    getContractAt(
      name: "IERC20MetadataUpgradeable",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.IERC20MetadataUpgradeable>;
    getContractAt(
      name: "IERC20Upgradeable",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.IERC20Upgradeable>;
    getContractAt(
      name: "Initializable",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.Initializable>;
    getContractAt(
      name: "IRule",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.IRule>;
    getContractAt(
      name: "IRuleEngine",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.IRuleEngine>;
    getContractAt(
      name: "MetaTxModule",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.MetaTxModule>;
    getContractAt(
      name: "MintModule",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.MintModule>;
    getContractAt(
      name: "PausableUpgradeable",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.PausableUpgradeable>;
    getContractAt(
      name: "PauseModule",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.PauseModule>;
    getContractAt(
      name: "SnapshotModule",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.SnapshotModule>;
    getContractAt(
      name: "SnapshotModuleInternal",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.SnapshotModuleInternal>;
    getContractAt(
      name: "ValidationModule",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.ValidationModule>;
    getContractAt(
      name: "ValidationModuleInternal",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.ValidationModuleInternal>;
    getContractAt(
      name: "IERC20",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.IERC20>;
    getContractAt(
      name: "IZklabV1Callee",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.IZklabV1Callee>;
    getContractAt(
      name: "IZklabV1ERC20",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.IZklabV1ERC20>;
    getContractAt(
      name: "IZklabV1Factory",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.IZklabV1Factory>;
    getContractAt(
      name: "IZklabV1Pair",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.IZklabV1Pair>;
    getContractAt(
      name: "ZklabV1ERC20",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.ZklabV1ERC20>;
    getContractAt(
      name: "ZklabV1Factory",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.ZklabV1Factory>;
    getContractAt(
      name: "ZklabV1Pair",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.ZklabV1Pair>;
    getContractAt(
      name: "IOwnable",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.IOwnable>;
    getContractAt(
      name: "IOwnable",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.IOwnable>;
    getContractAt(
      name: "Ownable",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.Ownable>;
    getContractAt(
      name: "IERC20",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.IERC20>;
    getContractAt(
      name: "IOwnable",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.IOwnable>;
    getContractAt(
      name: "Ownable",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.Ownable>;
    getContractAt(
      name: "PooPreps",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.PooPreps>;
    getContractAt(
      name: "IArrayV1Factory",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.IArrayV1Factory>;
    getContractAt(
      name: "IArrayV1Pair",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.IArrayV1Pair>;
    getContractAt(
      name: "IArrayV1Router01",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.IArrayV1Router01>;
    getContractAt(
      name: "IArrayV1Router02",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.IArrayV1Router02>;
    getContractAt(
      name: "IERC20",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.IERC20>;
    getContractAt(
      name: "IWETH",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.IWETH>;
    getContractAt(
      name: "Router02",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.Router02>;
    getContractAt(
      name: "WETH9",
      address: string,
      signer?: ethers.Signer
    ): Promise<Contracts.WETH9>;

    // default types
    getContractFactory(
      name: string,
      signerOrOptions?: ethers.Signer | FactoryOptions
    ): Promise<ethers.ContractFactory>;
    getContractFactory(
      abi: any[],
      bytecode: ethers.utils.BytesLike,
      signer?: ethers.Signer
    ): Promise<ethers.ContractFactory>;
    getContractAt(
      nameOrAbi: string | any[],
      address: string,
      signer?: ethers.Signer
    ): Promise<ethers.Contract>;
  }
}

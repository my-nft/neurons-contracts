/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */

import { Contract, Signer, utils } from "ethers";
import type { Provider } from "@ethersproject/providers";
import type {
  IFactoryDef,
  IFactoryDefInterface,
} from "../../Factory.sol/IFactoryDef";

const _abi = [
  {
    inputs: [],
    name: "kacyToken",
    outputs: [
      {
        internalType: "address",
        name: "",
        type: "address",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "minimumKacy",
    outputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
] as const;

export class IFactoryDef__factory {
  static readonly abi = _abi;
  static createInterface(): IFactoryDefInterface {
    return new utils.Interface(_abi) as IFactoryDefInterface;
  }
  static connect(
    address: string,
    signerOrProvider: Signer | Provider
  ): IFactoryDef {
    return new Contract(address, _abi, signerOrProvider) as IFactoryDef;
  }
}

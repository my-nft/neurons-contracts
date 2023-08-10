/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */

import { Contract, Signer, utils } from "ethers";
import type { Provider } from "@ethersproject/providers";
import type {
  IcrpFactory,
  IcrpFactoryInterface,
} from "../../CrpFactory.sol/IcrpFactory";

const _abi = [
  {
    inputs: [
      {
        internalType: "address",
        name: "addr",
        type: "address",
      },
    ],
    name: "isCrp",
    outputs: [
      {
        internalType: "bool",
        name: "",
        type: "bool",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
] as const;

export class IcrpFactory__factory {
  static readonly abi = _abi;
  static createInterface(): IcrpFactoryInterface {
    return new utils.Interface(_abi) as IcrpFactoryInterface;
  }
  static connect(
    address: string,
    signerOrProvider: Signer | Provider
  ): IcrpFactory {
    return new Contract(address, _abi, signerOrProvider) as IcrpFactory;
  }
}

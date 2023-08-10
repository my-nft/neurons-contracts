/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */

import { Contract, Signer, utils } from "ethers";
import type { Provider } from "@ethersproject/providers";
import type {
  IERC1404,
  IERC1404Interface,
} from "../../CMTAT-flat.sol/IERC1404";

const _abi = [
  {
    inputs: [
      {
        internalType: "address",
        name: "_from",
        type: "address",
      },
      {
        internalType: "address",
        name: "_to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "_amount",
        type: "uint256",
      },
    ],
    name: "detectTransferRestriction",
    outputs: [
      {
        internalType: "uint8",
        name: "",
        type: "uint8",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint8",
        name: "_restrictionCode",
        type: "uint8",
      },
    ],
    name: "messageForTransferRestriction",
    outputs: [
      {
        internalType: "string",
        name: "",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
] as const;

export class IERC1404__factory {
  static readonly abi = _abi;
  static createInterface(): IERC1404Interface {
    return new utils.Interface(_abi) as IERC1404Interface;
  }
  static connect(
    address: string,
    signerOrProvider: Signer | Provider
  ): IERC1404 {
    return new Contract(address, _abi, signerOrProvider) as IERC1404;
  }
}
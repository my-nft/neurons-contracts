/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */

import { Contract, Signer, utils } from "ethers";
import type { Provider } from "@ethersproject/providers";
import type {
  ValidationModuleInternal,
  ValidationModuleInternalInterface,
} from "../../CMTAT_STANDALONE_FLAT.sol/ValidationModuleInternal";

const _abi = [
  {
    anonymous: false,
    inputs: [
      {
        indexed: false,
        internalType: "uint8",
        name: "version",
        type: "uint8",
      },
    ],
    name: "Initialized",
    type: "event",
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: true,
        internalType: "address",
        name: "newRuleEngine",
        type: "address",
      },
    ],
    name: "RuleEngineSet",
    type: "event",
  },
  {
    inputs: [],
    name: "ruleEngine",
    outputs: [
      {
        internalType: "contract IRuleEngine",
        name: "",
        type: "address",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
] as const;

export class ValidationModuleInternal__factory {
  static readonly abi = _abi;
  static createInterface(): ValidationModuleInternalInterface {
    return new utils.Interface(_abi) as ValidationModuleInternalInterface;
  }
  static connect(
    address: string,
    signerOrProvider: Signer | Provider
  ): ValidationModuleInternal {
    return new Contract(
      address,
      _abi,
      signerOrProvider
    ) as ValidationModuleInternal;
  }
}

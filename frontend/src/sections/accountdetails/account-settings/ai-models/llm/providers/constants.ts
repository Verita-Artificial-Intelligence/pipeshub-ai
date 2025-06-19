// providers/constants.ts

import { openAIProvider } from './openai';
import { geminiProvider } from './gemini';
import { anthropicProvider } from './anthropic';
import { azureOpenAIProvider } from './azure-openai';
import { openAICompatibleProvider } from './openai-compatible';

import type { ProviderType, ProviderConfig } from './types';

// All providers in a simple array
export const providers = [
  openAIProvider,
  azureOpenAIProvider,
  geminiProvider,
  anthropicProvider,
  openAICompatibleProvider
];

// Helper function to get provider by ID
export const getProviderById = (id: ProviderType): ProviderConfig | undefined =>
  providers.find(provider => provider.id === id);
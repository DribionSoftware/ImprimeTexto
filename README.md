# ImprimeTexto
Componente para impressão matricial usando .Net.

Se você precisa usar uma impressora matricial diretamente na porta LPTx, este componente irá lhe ajudar a criar impressoes no estilo MS-DOS.

[![Build status](https://ci.appveyor.com/api/projects/status/egxramujkc2j8vpx?svg=true)](https://ci.appveyor.com/project/carloscds/imprimetexto)
[![Issues open](https://img.shields.io/github/issues/CDSInformatica/ImprimeTexto.svg)](https://github.com/CDSInformatica/ImprimeTexto/issues)
[![Nuget count](http://img.shields.io/nuget/v/CDSImprimeTexto.svg)](https://www.nuget.org/packages/CDSImprimeTexto/)

Exemplo de uso:
```csharp
ImprimeTexto imp = new ImprimeTexto();

imp.Inicio("LPT1");

imp.ImpLF("Carlos dos Santos - MVP C#");
imp.ImpLF("CDS Informática Ltda.");
imp.ImpLF("-------------------------------------");
imp.ImpLF("Componente de impressao em modo texto");
for (int i = 0; i < 5; i++)
{
    imp.ImpLF("Linha impressa " + i.ToString());
}
imp.ImpLF(imp.NegritoOn + "Negrito ligado" + imp.NegritoOff);
imp.ImpLF(imp.Expandido + "Expandido" + imp.Normal);
imp.ImpLF(imp.Comprimido + "Comprimido" + imp.Normal);
imp.Pula(2);
imp.ImpCol(10, "Coluna 10");
imp.ImpCol(40, "Coluna 40");
imp.Pula(2);
imp.Imp((char)27 + "0");
imp.ImpLF("8 linha ppp");
imp.ImpLF("8 linha ppp");
imp.ImpLF("8 linha ppp");
imp.Imp((char)27 + "2");
imp.ImpLF("6 linha ppp");
imp.ImpLF("6 linha ppp");
imp.ImpLF("6 linha ppp");
imp.Pula(2);
imp.Fim();

```

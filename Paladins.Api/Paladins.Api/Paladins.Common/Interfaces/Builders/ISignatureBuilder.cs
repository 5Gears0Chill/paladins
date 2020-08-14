using System;
using System.Collections.Generic;
using System.Text;

namespace Paladins.Common.Interfaces.Builders
{
    public interface ISignatureBuilder
    {
        string GenerateSignature(string relativePath);
    }
}

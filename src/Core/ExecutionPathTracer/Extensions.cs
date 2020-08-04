// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

#nullable enable

using System;
using System.Collections.Generic;
using Microsoft.Quantum.Simulation.Common;
using Microsoft.Quantum.Simulation.Core;

namespace Microsoft.Quantum.IQSharp.Core.ExecutionPathTracer
{
    public class TracerApplyIfElse : Microsoft.Quantum.Simulation.QuantumProcessor.Extensions.ApplyIfElseR<Qubit, Qubit>
    {
        private SimulatorBase Simulator { get; }

        public TracerApplyIfElse(SimulatorBase m) : base(m)
        {
            this.Simulator = m;
        }

        public override Func<(Result, (ICallable, Qubit), (ICallable, Qubit)), QVoid> Body => (q) =>
        {
            (Result measurementResult, (ICallable onZero, Qubit one), (ICallable onOne, Qubit two)) = q;
            onZero.Apply(QVoid.Instance);
            onOne.Apply(QVoid.Instance);

            return QVoid.Instance;
        };
    }

    /// <summary>
    /// Extension methods to be used with and by <see cref="ExecutionPathTracer">.
    /// </summary>
    public static class Extensions
    {
        /// <summary>
        /// Attaches <see cref="ExecutionPathTracer"> event listeners to the simulator to generate
        /// the <see cref="ExecutionPath"> of the operation performed by the simulator.
        /// </summary>
        public static T WithExecutionPathTracer<T>(this T sim, ExecutionPathTracer tracer)
            where T : SimulatorBase
        {
            sim.OnOperationStart += tracer.OnOperationStartHandler;
            sim.OnOperationEnd += tracer.OnOperationEndHandler;
            sim.Register(
                typeof(Microsoft.Quantum.Canon.ApplyIfElseR<Qubit, Qubit>),
                typeof(TracerApplyIfElse)
            );
            return sim;
        }

        /// <summary>
        /// Gets the value associated with the specified key and creates a new entry with the <c>defaultVal</c> if
        /// the key doesn't exist.
        /// </summary>
        public static TValue GetOrCreate<TKey, TValue>(this IDictionary<TKey, TValue> dict, TKey key, TValue defaultVal)
        {
            TValue val;
            if (!dict.TryGetValue(key, out val))
            {
                val = defaultVal;
                dict.Add(key, val);
            }
            return val;
        }

        /// <summary>
        /// Gets the value associated with the specified key and creates a new entry of the default type if
        /// the key doesn't exist.
        /// </summary>
        public static TValue GetOrCreate<TKey, TValue>(this IDictionary<TKey, TValue> dict, TKey key)
            where TValue : new() => dict.GetOrCreate(key, new TValue());
    }
}
